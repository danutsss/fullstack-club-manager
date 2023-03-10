<template>
	<DashboardNavBar />

	<section class="relative mt-28 mb-28">
		<div class="container flex flex-col">
			<div class="col-span-2">
				<div id="user__list">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="text-center font-body font-semibold text-sm text-gray-500"
						>
							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-1/4">
									<label for="userEmail" class="sr-only">
										Adresa de e-mail utilizator
									</label>
									<input
										id="userEmail"
										name="userEmail"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cautare adresa de e-mail"
										@keyup="searchUsers()"
									/>
								</div>
							</div>
						</DisclosurePanel>
					</Disclosure>
					<div class="bg-white p-4 shadow-lg mt-2 rounded-[0.625rem]">
						<div class="overflow-y-auto overflow-visible">
							<table
								class="table-auto w-full text-black border-separate space-y-6 text-sm"
							>
								<thead
									class="bg-gray-300 text-black font-display sticky top-0"
								>
									<tr>
										<th class="p-3">Nume utilizator</th>
										<th class="p-3">Rol</th>
										<th class="p-3">Moderator</th>
										<th class="p-3">Categorii moderate</th>
										<th class="p-3">Actiuni</th>
									</tr>
								</thead>
								<tbody v-for="user in users" class="font-body">
									<tr :key="user.id">
										<td class="p-3">
											<div
												class="flex align-items-center"
											>
												<div class="ml-3">
													<div class="font-bold">
														{{ user.email }}
													</div>
													<div class="text-gray-500">
														{{
															formatDate(
																user.registrationDate
															)
														}}
													</div>
												</div>
											</div>
										</td>
										<td class="p-3">
											{{ user.role }}
										</td>

										<td class="p-3">
											Euroregiunea
											{{ user.euroRegionMod }}
										</td>

										<td class="p-3">
											<span
												v-for="(
													category, index
												) in user.categoryMod"
											>
												<span>{{ category }}</span>
												<span
													v-if="
														index + 1 <
														user.categoryMod.length
													"
													>,
												</span>
											</span>
										</td>

										<td
											class="p-3 flex justify-center gap-2"
										>
											<ClientOnly>
												<NuxtLink
													:to="`/dashboard/user/view/${user.id}`"
												>
													<font-awesome-icon
														icon="fa-solid fa-eye"
														class="text-nepal-700"
													/>
												</NuxtLink>
											</ClientOnly>

											<ClientOnly
												v-if="userRole === 'ADMIN'"
											>
												<font-awesome-icon
													icon="fa-solid fa-trash"
													class="text-red-500 cursor-pointer"
													@click="deleteUser(user.id)"
												/>
											</ClientOnly>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>

<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
const supabase = useSupabaseClient();

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

const { data: users } = await supabase
	.from("profiles")
	.select("id, role, euroRegionMod, email, categoryMod, registrationDate");

const deleteUser = async (id) => {
	const { error } = await supabase.from("profiles").delete().match({ id });

	if (error) {
		console.log(error);
	} else {
		location.reload();
	}
};

const searchUsers = () => {
	const input = document.getElementById("userEmail");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("user__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[0];
		if (td) {
			const txtValue = td.textContent || td.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
};
</script>

<style scoped>
.table {
	border-spacing: 0 5px;
}

i {
	font-size: 1rem !important;
}

.table tr {
	border-radius: 20px;
}

tr td:nth-child(n + 5),
tr th:nth-child(n + 5) {
	border-radius: 0 0.625rem 0.625rem 0;
}

tr td:nth-child(1),
tr th:nth-child(1) {
	border-radius: 0.625rem 0 0 0.625rem;
}
</style>
