<script setup>
const route = useRoute();
const { data: athlete } = await useFetch(
	() => `/api/athlete/view/${route.params.id}`
);

const supabase = useSupabaseClient();

// Get all euro regions from the database.
const { data } = await useFetch("/api/euroregion/all");
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's euroRegion number.
const euroRegionNumber = await getEuroregion(user.id);
const euroRegionMod = euroRegionNumber[0].euroRegionMod;

const clubName = ref("");
const athleteName = ref("");
const athleteBelt = ref("");
const yearOfBirth = ref("");
const passedExam = ref("");
const euroRegiune = ref("");

const editAthlete = async (id) =>
	await $fetch(`/api/athlete/edit/${id}`, {
		method: "PATCH",
		body: {
			clubName: clubName.value,
			fullName: athleteName.value,
			yearOfBirth: Number(yearOfBirth.value),
			passedExam: passedExam.value,
			belt: athleteBelt.value,
			euroRegion: euroRegiune.value,
		},
	})
		.then((response) => {
			console.log(response);

			if (response.code === "[error]") {
				console.log(response.message);
				return;
			}

			return console.log(
				`${id} has been edited successfully into our database.`
			);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error.statusMessage}`);
		});

const deleteAthlete = async (id) =>
	await useFetch(`/api/athlete/delete/${id}`, {
		method: "DELETE",
	})
		.then(() => {
			// Refresh page.
			location.href = "/dashboard";
		})
		.catch((error) => {
			console.error(error);
		});
</script>

<template>
	<DashboardNavBar />

	<div class="container mt-6 mb-6">
		<h1
			class="text-3xl md:text-4xl lg:text-[2.85rem] text-center font-display uppercase font-bold mb-3"
		>
			Modificari
			<span class="text-nepal-600">{{ athlete.fullName }}</span>
		</h1>
	</div>

	<div class="container flex flex-col justify-center w-1/2">
		<div id="athlete__info">
			<div class="bg-white p-5 shadow-lg rounded-lg font-body">
				<form
					@submit.prevent="editAthlete(athlete.id)"
					class="space-y-6"
				>
					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2">
							<label for="clubName" class="sr-only"
								>Nume club sportiv</label
							>
							<input
								id="clubName"
								v-model="clubName"
								name="clubName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.clubName"
							/>
						</div>

						<div class="w-1/2">
							<label for="athleteName" class="sr-only"
								>Nume sportiv</label
							>
							<input
								id="athleteName"
								v-model="athleteName"
								name="athleteName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.fullName"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2">
							<label for="athleteBelt" class="sr-only"
								>Centura</label
							>
							<input
								id="athleteBelt"
								v-model="athleteBelt"
								name="athleteBelt"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.belt"
							/>
						</div>

						<div class="w-1/2">
							<label for="yearOfBirth" class="sr-only"
								>An nastere</label
							>
							<input
								id="yearOfBirth"
								v-model="yearOfBirth"
								name="yearOfBirth"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.yearOfBirth"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2">
							<label for="passedExam" class="sr-only"
								>Admis</label
							>
							<input
								id="passedExam"
								v-model="passedExam"
								name="passedExam"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.passedExam"
							/>
						</div>

						<div class="w-1/2">
							<label for="yearOfBirth" class="sr-only"
								>Euroregiune</label
							>
							<select
								id="euroRegiune"
								v-model="euroRegiune"
								name="euroRegiune"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
							>
								<option value="" disabled selected>
									Euroregiunea {{ athlete.euroRegion }}
								</option>
								<option
									v-if="userRole === 'ADMIN'"
									v-for="euroregion in data"
									:value="euroregion.id"
								>
									{{ euroregion.name }}
								</option>

								<option v-else :value="euroRegionMod">
									<!-- show the region that the user is moderator to -->
									Euroregiunea {{ euroRegionMod }}
								</option>
							</select>
						</div>
					</div>

					<div>
						<button
							type="submit"
							class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
						>
							Modifica sportiv
						</button>
					</div>
				</form>

				<button
					@click="deleteAthlete(athlete.id)"
					class="mt-2 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
				>
					Sterge sportiv
				</button>
			</div>
		</div>
	</div>
</template>
