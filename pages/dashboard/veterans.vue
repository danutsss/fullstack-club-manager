<template>
	<DashboardNavBar />

	<section class="relative mt-28 mb-28">
		<div class="container flex flex-col">
			<div class="col-span-2">
				<div id="veteran__list">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="text-center font-body font-semibold text-sm text-gray-500"
						>
							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-1/4">
									<label for="vetName" class="sr-only">
										Nume veteran
									</label>
									<input
										id="vetName"
										name="vetName"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Nume veteran"
										@keyup="searchVeterans()"
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
										<th class="p-3">Nume veteran</th>
										<th class="p-3">Adresa de e-mail</th>
										<th class="p-3">
											Categorie de greutate
										</th>
										<th class="p-3">Categorie de varsta</th>
										<th class="p-3">Gradatie</th>
										<th class="p-3">Nr. de telefon</th>
										<th class="p-3">Actiuni</th>
									</tr>
								</thead>
								<tbody
									v-for="veteran in data"
									class="font-body"
								>
									<tr :key="veteran.id">
										<td class="p-3">
											<div
												class="flex align-items-center"
											>
												<div class="ml-3">
													<div class="font-bold">
														{{ veteran.firstName }}
														{{ veteran.lastName }}
													</div>
													<div class="text-gray-500">
														{{
															veteran.dateOfBirth
														}}
													</div>
												</div>
											</div>
										</td>
										<td class="p-3">
											{{ veteran.emailAddress }}
										</td>

										<td class="p-3">
											{{ veteran.weightCat }}
										</td>

										<td class="p-3">
											{{ veteran.ageCat }}
										</td>

										<td class="p-3">
											{{ veteran.gradation }}
										</td>

										<td class="p-3">
											{{ veteran.phoneNo }}
										</td>

										<td
											class="p-3 flex justify-center gap-2"
										>
											<ClientOnly>
												<font-awesome-icon
													icon="fa-solid fa-pen-to-square"
												/>
											</ClientOnly>

											<ClientOnly>
												<font-awesome-icon
													icon="fa-solid fa-eye"
													class="text-nepal-700"
												/>
											</ClientOnly>

											<ClientOnly>
												<font-awesome-icon
													icon="fa-solid fa-trash"
													class="text-red-500"
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
const { data } = await useFetch("/api/veteran/all");

const searchVeterans = () => {
	const input = document.getElementById("vetName");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("veteran__list");
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

tr td:nth-child(n + 7),
tr th:nth-child(n + 7) {
	border-radius: 0 0.625rem 0.625rem 0;
}

tr td:nth-child(1),
tr th:nth-child(1) {
	border-radius: 0.625rem 0 0 0.625rem;
}
</style>
