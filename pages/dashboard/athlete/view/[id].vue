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

// Get all clubs from the database.
const { data: clubs } = await useFetch("/api/club/all");

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's euroRegion number.
const euroRegionNumber = await getEuroregion(user.id);
const euroRegionMod = euroRegionNumber[0].euroRegionMod;

const clubName = ref(athlete.clubName);
const athleteName = ref(athlete.fullName);
const athleteBelt = ref(athlete.belt);
const dateOfBirth = ref(athlete.dateOfBirth);
const passedExam = ref(athlete.passedExam);
const euroRegiune = ref(athlete.euroRegion);
const athleteCNP = ref(athlete.athleteCNP);
const athleteGender = ref(athlete.athleteGender);
const athleteWeightCat = ref(athlete.weightCat);

// Weight categories based on their gender.
const weightCategories = ref([
	{ gender: "MASCULIN", category: "-26kg" },
	{ gender: "MASCULIN", category: "-30kg" },
	{ gender: "MASCULIN", category: "-34kg" },
	{ gender: "MASCULIN", category: "-38kg" },
	{ gender: "MASCULIN", category: "-42kg" },
	{ gender: "MASCULIN", category: "-46kg" },
	{ gender: "MASCULIN", category: "-50kg" },
	{ gender: "MASCULIN", category: "-55kg" },
	{ gender: "MASCULIN", category: "-60kg" },
	{ gender: "MASCULIN", category: "+60kg" },
	{ gender: "MASCULIN", category: "-66kg" },
	{ gender: "MASCULIN", category: "-73kg" },
	{ gender: "MASCULIN", category: "-81kg" },
	{ gender: "MASCULIN", category: "-90kg" },
	{ gender: "MASCULIN", category: "-100kg" },
	{ gender: "MASCULIN", category: "+100kg" },
	{ gender: "FEMININ", category: "-28kg" },
	{ gender: "FEMININ", category: "-32kg" },
	{ gender: "FEMININ", category: "-36kg" },
	{ gender: "FEMININ", category: "-40kg" },
	{ gender: "FEMININ", category: "-44kg" },
	{ gender: "FEMININ", category: "-48kg" },
	{ gender: "FEMININ", category: "-52kg" },
	{ gender: "FEMININ", category: "-57kg" },
	{ gender: "FEMININ", category: "+57kg" },
	{ gender: "FEMININ", category: "-63kg" },
	{ gender: "FEMININ", category: "-70kg" },
	{ gender: "FEMININ", category: "-78kg" },
	{ gender: "FEMININ", category: "+78kg" },
]);

const updateSelectedGender = () => {
	return athleteGender.value;
};

const filteredWeightCategories = computed(() => {
	return weightCategories.value.filter(
		(category) => category.gender === athleteGender.value
	);
});

const editAthlete = async (id) =>
	await $fetch(`/api/athlete/edit/${id}`, {
		method: "PATCH",
		body: {
			clubName: clubName.value,
			fullName: athleteName.value,
			dateOfBirth: dateOfBirth.value,
			passedExam: passedExam.value,
			belt: athleteBelt.value,
			euroRegion: euroRegiune.value,
		},
	})
		.then((response) => {
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
					class="space-y-5"
				>
					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2">
							<label for="clubName" class="sr-only"
								>Nume club sportiv</label
							>
							<select
								id="clubName"
								v-model="clubName"
								name="clubName"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
							>
								<option value="" disabled selected>
									Alege club
								</option>
								<option
									v-for="club in clubs"
									:value="club.clubName"
								>
									{{ club.clubName }}
								</option>
							</select>
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
							<label for="dateOfBirth" class="sr-only"
								>An nastere</label
							>
							<input
								id="dateOfBirth"
								v-model="dateOfBirth"
								name="dateOfBirth"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.dateOfBirth"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label for="athleteCNP" class="sr-only">CNP</label>
							<input
								id="athleteCNP"
								v-model="athleteCNP"
								name="athleteCNP"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="athlete.athleteCNP"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2">
							<label for="athleteGender" class="sr-only"
								>Gen sportiv</label
							>
							<select
								id="athleteGender"
								v-model="athleteGender"
								name="athleteGender"
								@change="updateSelectedGender()"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
							>
								<option value="" disabled selected>
									Alege genul sportivului
								</option>
								<option value="MASCULIN">Masculin</option>
								<option value="FEMININ">Feminin</option>
							</select>
						</div>

						<div class="w-1/2">
							<label for="athleteWeightCat" class="sr-only"
								>Categoria de greutate</label
							>
							<select
								id="athleteWeightCat"
								v-model="athleteWeightCat"
								name="athleteWeightCat"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
							>
								<option value="" disabled selected>
									Alege categoria de greutate
								</option>
								<option
									v-for="category in filteredWeightCategories"
									:value="category.category"
									:key="category.category"
								>
									{{ category.category }}
								</option>
							</select>
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
							<label for="dateOfBirth" class="sr-only"
								>Euroregiune</label
							>
							<select
								id="euroRegiune"
								v-model="euroRegiune"
								name="euroRegiune"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
							>
								<option value="" disabled selected>
									Alege euroregiune
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
							class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
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
