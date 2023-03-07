<template>
	<DashboardNavBar />
	<section class="relative mt-28 mb-28">
		<div class="container flex flex-col lg:grid lg:grid-cols-3 gap-4">
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
							class="text-gray-500 text-2xl font-bold mt-3 mb-3 text-center"
						>
							{{ user.email }}</span
						>
						<span
							class="border-san-marino-500 border-2 text-san-marino-500 font-bold p-3 rounded w-auto text-center"
							>{{ userRole }}</span
						>
					</div>
				</div>
			</div>
			<div class="col-span-2">
				<div id="addathlete__form">
					<div
						v-if="userRole === 'ADMIN' || euroRegionMod != 0"
						class="bg-white p-5 shadow-lg rounded-3xl"
					>
						<h1
							class="font-display text-center mb-4 uppercase font-bold"
						>
							Adaugare sportiv in Euroregiuni
						</h1>
						<form @submit.prevent="addathlete()" class="space-y-6">
							<div class="flex flex-row rounded-md gap-2">
								<div class="w-1/2">
									<label for="clubName" class="sr-only"
										>Nume asociatie / club sportiv</label
									>
									<input
										id="clubName"
										v-model="clubName"
										name="clubName"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Nume asociatie / club sportiv"
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
										placeholder="Nume sportiv"
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
										placeholder="Centura"
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
										placeholder="An nastere"
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
										placeholder="Admis"
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
											Alege Euroregiune
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
									Insereaza sportiv
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>

<script setup>
const supabase = useSupabaseClient();

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's euroRegion number.
const euroRegionNumber = await getEuroregion(user.id);
const euroRegionMod = euroRegionNumber[0].euroRegionMod;

let clubName = ref("");
let athleteName = ref("");
let athleteBelt = ref("");
let yearOfBirth = ref("");
let passedExam = ref("");
let euroRegiune = ref("");

const { data } = await useFetch("/api/euroregion/all");

onMounted(async () => {
	clubName = clubName.value;
	athleteName = athleteName.value;
	athleteBelt = athleteBelt.value;
	yearOfBirth = yearOfBirth.value;
	passedExam = passedExam.value;
	euroRegiune = euroRegiune.value;
});

const addathlete = async () => {
	return await $fetch("api/athlete", {
		method: "POST",
		body: {
			clubName: clubName,
			fullName: athleteName,
			yearOfBirth: Number(yearOfBirth),
			passedExam: passedExam,
			belt: athleteBelt,
			euroRegion: euroRegiune,
		},
	})
		.then((response) => {
			console.log(response);

			if (response.code === "[error]") {
				console.log(response.message);
			} else
				return console.log(
					`athlete [${athleteName}] added successfully in our database.`
				);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error.statusMessage}`);
		});
};

watchEffect(() => {
	if (!user) {
		return navigateTo("/sign-in");
	}
});

definePageMeta({
	middleware: "auth",
});
</script>
