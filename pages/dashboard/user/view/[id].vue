<script setup>
const route = useRoute();
const supabase = useSupabaseClient();

let role = ref("");
let euroRegiune = ref("");
let categoryModerator = ref([]);

const categories = [
	{ id: 1, name: "ANTRENORI" },
	{ id: 2, name: "CLUBURI" },
	{ id: 3, name: "VETERANI" },
];

const { data: user } = await supabase
	.from("profiles")
	.select("id, role, euroRegionMod, categoryMod, email, registrationDate")
	.match({ id: route.params.id });

// Get all euro regions from the database.
const { data } = await useFetch("/api/euroregion/all");

const updateUser = async (id) => {
	if (role.value === "" || euroRegiune.value === "") {
		return alert(
			"Selecteaza rolul, euroregiunea si categoria pt. moderare."
		);
	}

	return await supabase
		.from("profiles")
		.update({
			role: role?.value,
			euroRegionMod: euroRegiune?.value,
			categoryMod: categoryModerator?.value,
		})
		.eq("id", id)
		.then((response) => {
			// Reload the page.
			location.reload();

			return console.log(
				`${id} has been edited successfully into our database.`
			);
		})
		.catch((error) => console.error(error));
};

const deleteUser = async (id) =>
	await supabase
		.from("profiles")
		.delete()
		.eq("id", id)
		.then((response) => {
			// Reload the page.
			location.href = "/dashboard/users";

			return console.log(
				`${id} has been deleted successfully from our database.`
			);
		})
		.catch((error) => console.error(error));
</script>

<template>
	<DashboardNavBar />

	<section class="relative mt-7 mb-7">
		<div class="container flex flex-col lg:grid lg:grid-cols-3 gap-2">
			<div id="profile__container">
				<div class="bg-white p-5 shadow-lg rounded-3xl">
					<div id="profile__image">
						<img
							src="~/assets/images/profile_picture.webp"
							class="rounded-full bg-nepal-200 h-[120px] w-[120px] mx-auto"
						/>
					</div>

					<div
						id="profile__information"
						class="flex flex-col justify-center"
					>
						<span
							class="text-gray-500 text-2xl font-bold mt-3 mb-2 text-center"
						>
							{{ user[0].email }}</span
						>
						<span
							class="border-san-marino-500 border-2 text-san-marino-500 mb-1 font-bold p-1 rounded w-auto text-center"
							>{{ user[0].role }}</span
						>

						<span
							v-if="user[0].euroRegionMod !== 0"
							class="border-bondi-blue-500 border-2 text-bondi-blue-500 font-bold p-1 mb-1 rounded w-auto text-center uppercase"
							>Moderator Euroregiunea
							{{ user[0].euroRegionMod }}</span
						>

						<span
							v-for="category in user[0].categoryMod"
							class="border-pacific-blue-500 border-2 text-pacific-blue-500 font-bold p-1 mb-1 rounded w-auto text-center uppercase"
							>Moderator: {{ category }}</span
						>
					</div>
				</div>
			</div>

			<div id="updateUser" class="col-span-2">
				<div class="bg-white p-5 shadow-lg rounded-3xl">
					<h1
						class="font-display text-center mb-4 uppercase font-bold"
					>
						Actualizeaza utilizator
					</h1>

					<form
						@submit.prevent="updateUser(user[0].id)"
						class="space-y-6"
					>
						<div class="flex flex-row rounded-md gap-2">
							<div class="w-1/2">
								<label for="role" class="sr-only">Rol</label>
								<select
									id="role"
									v-model="role"
									name="role"
									class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								>
									<option value="" disabled selected>
										Alege rol
									</option>
									<option value="MODERATOR">Moderator</option>
									<option value="USER">User</option>
									<option value="ADMIN">Admin</option>
								</select>
							</div>

							<div class="w-1/2">
								<label for="euroRegiune" class="sr-only"
									>Moderator Euroregiune</label
								>
								<select
									id="euroRegiune"
									v-model="euroRegiune"
									name="euroRegiune"
									class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								>
									<option value="" disabled selected>
										Alege Euroregiune
									</option>
									<option value="0">
										Fara moderator euroregiune
									</option>
									<option
										v-for="euroregion in data"
										:value="euroregion.id"
									>
										{{ euroregion.name }}
									</option>
								</select>
							</div>
						</div>

						<div class="flex flex-row rounded-md gap-2">
							<div class="w-full">
								<label
									for="categoryModerator"
									class="font-body text-xs"
									>Selecteaza una sau mai multe categorii
									pentru moderare:</label
								>
								<select
									id="categoryModerator"
									name="categoryModerator"
									multiple="true"
									v-model="categoryModerator"
									class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								>
									<option
										v-for="category in categories"
										:value="category.name"
									>
										{{ category.name }}
									</option>
								</select>
							</div>
						</div>

						<div>
							<button
								type="submit"
								class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
							>
								Actualizeaza user
							</button>
						</div>
					</form>

					<button
						@click="deleteUser(user[0].id)"
						class="w-full mt-2 flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
					>
						Sterge user
					</button>
				</div>
			</div>
		</div>
	</section>
</template>
