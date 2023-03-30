<script setup>
const route = useRoute();
const { data: club } = await useFetch(
	() => `/api/club/view/${route.params.id}`
);

const supabase = useSupabaseClient();

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's category moderator.
const categories = await getCategory(user.id);
const userCategoryMod = categories[0].categoryMod;

// Make inputs read-only if the user is not admin or moderator.
const isReadOnly = () => {
	return userRole !== "ADMIN" && userCategoryMod.indexOf("CLUBURI") === -1;
};

let clubName = ref("");
let clubCity = ref("");
let zipCode = ref("");
let clubCounty = ref("");
let clubAddress = ref("");
let clubContactPerson = ref("");
let clubEmail = ref("");
let clubAfiliatFRJ = ref("");
let clubAfiliatAJJ = ref("");
let clubCoachOneName = ref("");
let clubCoachTwoName = ref("");
let clubCoachThreeName = ref("");
let clubWebAddress = ref("");
let clubFbAddress = ref("");
let clubSocialAccounts = ref("");
let dojoOneAddress = ref("");
let dojoOneCity = ref("");
let dojoOneCounty = ref("");
let dojoOneContactPerson = ref("");
let dojoOneEmailAddress = ref("");
let dojoOneTatamiMP = ref("");
let dojoOneAgeGroups = ref("");
let dojoTwoAddress = ref("");
let dojoTwoCity = ref("");
let dojoTwoCounty = ref("");
let dojoTwoContactPerson = ref("");
let dojoTwoEmailAddress = ref("");
let dojoTwoTatamiMP = ref("");
let dojoTwoAgeGroups = ref("");
let dojoThreeAddress = ref("");
let dojoThreeCity = ref("");
let dojoThreeCounty = ref("");
let dojoThreeContactPerson = ref("");
let dojoThreeEmailAddress = ref("");
let dojoThreeTatamiMP = ref("");
let dojoThreeAgeGroups = ref("");
let clubExtraInfo = ref("");

onMounted(() => {
	clubName = clubName.value;
	clubCounty = clubCounty.value;
	clubCity = clubCity.value;
	clubAddress = clubAddress.value;
	zipCode = zipCode.value;
	clubContactPerson = clubContactPerson.value;
	clubEmail = clubEmail.value;
	clubAfiliatFRJ = clubAfiliatFRJ.value;
	clubAfiliatAJJ = clubAfiliatAJJ.value;
	clubCoachOneName = clubCoachOneName.value;
	clubCoachTwoName = clubCoachTwoName.value;
	clubCoachThreeName = clubCoachThreeName.value;
	clubWebAddress = clubWebAddress.value;
	clubFbAddress = clubFbAddress.value;
	clubSocialAccounts = clubSocialAccounts.value;
	dojoOneAddress = dojoOneAddress.value;
	dojoOneCity = dojoOneCity.value;
	dojoOneCounty = dojoOneCounty.value;
	dojoOneContactPerson = dojoOneContactPerson.value;
	dojoOneEmailAddress = dojoOneEmailAddress.value;
	dojoOneTatamiMP = dojoOneTatamiMP.value;
	dojoOneAgeGroups = dojoOneAgeGroups.value;
	dojoTwoAddress = dojoTwoAddress.value;
	dojoTwoCity = dojoTwoCity.value;
	dojoTwoCounty = dojoTwoCounty.value;
	dojoTwoContactPerson = dojoTwoContactPerson.value;
	dojoTwoEmailAddress = dojoTwoEmailAddress.value;
	dojoTwoTatamiMP = dojoTwoTatamiMP.value;
	dojoTwoAgeGroups = dojoTwoAgeGroups.value;
	dojoThreeAddress = dojoThreeAddress.value;
	dojoThreeCity = dojoThreeCity.value;
	dojoThreeCounty = dojoThreeCounty.value;
	dojoThreeContactPerson = dojoThreeContactPerson.value;
	dojoThreeEmailAddress = dojoThreeEmailAddress.value;
	dojoThreeTatamiMP = dojoThreeTatamiMP.value;
	dojoThreeAgeGroups = dojoThreeAgeGroups.value;
	clubExtraInfo = clubExtraInfo.value;
});

const editClub = async (id) =>
	await useFetch(() => `/api/club/edit/${id}`, {
		method: "PATCH",
		body: {
			clubName: clubName,
			clubCounty: clubCounty,
			clubAddress: `${clubAddress}, ${clubCity} - ${zipCode}`,
			clubContactPerson: clubContactPerson,
			clubEmail: clubEmail,
			clubAfiliatFRJ: clubAfiliatFRJ,
			clubAfiliatAJJ: clubAfiliatAJJ,
			clubCoachOneName: clubCoachOneName,
			clubCoachTwoName: clubCoachTwoName,
			clubCoachThreeName: clubCoachThreeName,
			clubWebAddress: clubWebAddress,
			clubFbAddress: clubFbAddress,
			clubSocialAccounts: clubSocialAccounts,
			dojoOneAddress: `${dojoOneAddress}, ${dojoOneCity}, ${dojoOneCounty}`,
			dojoOneContactPerson: dojoOneContactPerson,
			dojoOneEmailAddress: dojoOneEmailAddress,
			dojoOneTatamiMP: dojoOneTatamiMP,
			dojoOneAgeGroups: dojoOneAgeGroups,
			dojoTwoAddress: `${dojoTwoAddress}, ${dojoTwoCity}, ${dojoTwoCounty}`,
			dojoTwoContactPerson: dojoTwoContactPerson,
			dojoTwoEmailAddress: dojoTwoEmailAddress,
			dojoTwoTatamiMP: dojoTwoTatamiMP,
			dojoTwoAgeGroups: dojoTwoAgeGroups,
			dojoThreeAddress: `${dojoThreeAddress}, ${dojoThreeCity}, ${dojoThreeCounty}`,
			dojoThreeContactPerson: dojoThreeContactPerson,
			dojoThreeEmailAddress: dojoThreeEmailAddress,
			dojoThreeTatamiMP: dojoThreeTatamiMP,
			dojoThreeAgeGroups: dojoThreeAgeGroups,
			clubExtraInfo: clubExtraInfo,
		},
	})
		.then((response) => {
			console.log(response);

			if (response.code === "[error]") {
				console.log(response.message);
				return;
			}

			return console.log(
				`${clubName} has been edited successfully into our database.`
			);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error.statusMessage}`);
		});

const deleteClub = async (id) =>
	await useFetch(`/api/club/delete/${id}`, {
		method: "DELETE",
	})
		.then(() => location.reload())
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
			<span class="text-nepal-600">{{ club.clubName }}</span>
		</h1>
	</div>

	<div class="container flex flex-col justify-center w-1/2 mb-6">
		<div id="club__info">
			<div class="bg-white p-5 shadow-lg rounded-lg font-body">
				<form @submit.prevent="editClub(club.id)" class="space-y-5">
					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label for="clubName" class="font-body text-xs"
								>Nume asociatie / club sportiv</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubName"
								v-model="clubName"
								name="clubName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubName"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label for="clubAddress" class="font-body text-xs"
								>Adresa asociatie / club sportiv</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubAddress"
								v-model="clubAddress"
								name="clubAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label for="clubCity" class="font-body text-xs"
								>Localitate</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubCity"
								v-model="clubCity"
								name="clubCity"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubCity"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label for="clubCounty" class="font-body text-xs"
								>Judet / sector</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubCounty"
								v-model="clubCounty"
								name="clubCounty"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubCounty"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label for="zipCode" class="font-body text-xs"
								>Cod postal</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="zipCode"
								v-model="zipCode"
								name="zipCode"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.zipCode"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="clubContactPerson"
								class="font-body text-xs"
								>Numar de telefon / persoana de contact /
								functie</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubContactPerson"
								v-model="clubContactPerson"
								name="clubContactPerson"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubContactPerson"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label for="clubEmail" class="font-body text-xs"
								>Adresa de e-mail club / asociatie</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubEmail"
								v-model="clubEmail"
								name="clubEmail"
								type="email"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubEmail"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label
								for="clubAfiliatFRJ"
								class="font-body text-xs"
								>Afiliat Federatia Romana de Judo?</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubAfiliatFRJ"
								v-model="clubAfiliatFRJ"
								name="clubAfiliatFRJ"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubAfiliatFRJ"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label
								for="clubAfiliatAJJ"
								class="font-body text-xs"
								>Afiliat Asociatia Judeteana de Judo?</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubAfiliatAJJ"
								v-model="clubAfiliatAJJ"
								name="clubAfiliatAJJ"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubAfiliatAJJ"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label
								for="clubCoachOneName"
								class="font-body text-xs"
								>Nume antrenor 1</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubCoachOneName"
								v-model="clubCoachOneName"
								name="clubCoachOneName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubCoachOneName"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label
								for="clubCoachTwoName"
								class="font-body text-xs"
								>Nume antrenor 2</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubCoachTwoName"
								v-model="clubCoachTwoName"
								name="clubCoachTwoName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubCoachTwoName"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="clubCoachThreeName"
								class="font-body text-xs"
								>Nume antrenor 3</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubCoachThreeName"
								v-model="clubCoachThreeName"
								name="clubCoachThreeName"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubCoachThreeName"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label
								for="clubWebAddress"
								class="font-body text-xs"
								>Adresa web</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubWebAddress"
								v-model="clubWebAddress"
								name="clubWebAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubWebAddress"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label for="clubFbAddress" class="font-body text-xs"
								>Facebook</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="clubFbAddress"
								v-model="clubFbAddress"
								name="clubFbAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubFbAddress"
							/>
						</div>
					</div>

					<div class="rounded-md shadow-sm -space-y-px">
						<div class="w-full">
							<label
								for="clubSocialAccounts"
								class="font-body text-xs"
							>
								Alte conturi de socializare (Instagram, Snapchat
								etc.)
							</label>
							<textarea
								:disabled="isReadOnly() == true"
								maxlength="750"
								rows="5"
								id="clubSocialAccounts"
								v-model="clubSocialAccounts"
								name="clubSocialAccounts"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubSocialAccounts"
							></textarea>
						</div>
					</div>

					<hr inset />

					<div class="space-y-2">
						<h1
							class="font-semibold font-display uppercase text-san-marino-800 text-xl"
						>
							Informatii Dojo 1
						</h1>
						<div class="heading__line"></div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoOneAddress"
								class="font-body text-xs"
								>Adresa</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneAddress"
								v-model="dojoOneAddress"
								name="dojoOneAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoOneAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label for="dojoOneCity" class="font-body text-xs"
								>Localitate</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneCity"
								v-model="dojoOneCity"
								name="dojoOneCity"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Localitate"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label for="dojoOneCounty" class="font-body text-xs"
								>Judet / sector</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneCounty"
								v-model="dojoOneCounty"
								name="dojoOneCounty"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Judet / sector"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoOneContactPerson"
								class="font-body text-xs"
								>Numar de telefon / persoana de contact /
								functie</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneContactPerson"
								v-model="dojoOneContactPerson"
								name="dojoOneContactPerson"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoOneContactPerson"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoOneEmailAddress"
								class="font-body text-xs"
								>Adresa de e-mail</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneEmailAddress"
								v-model="dojoOneEmailAddress"
								name="dojoOneEmailAddress"
								type="email"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoOneEmailAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoOneTatamiMP"
								class="font-body text-xs"
								>MP de Tatami</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoOneTatamiMP"
								v-model="dojoOneTatamiMP"
								name="dojoOneTatamiMP"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoOneTatamiMP"
							/>
						</div>
					</div>

					<div class="rounded-md shadow-sm -space-y-px">
						<div class="w-full">
							<label
								for="dojoOneAgeGroups"
								class="font-body text-xs"
							>
								Grupe de varsta / program
							</label>
							<textarea
								:disabled="isReadOnly() == true"
								maxlength="750"
								rows="5"
								id="dojoOneAgeGroups"
								v-model="dojoOneAgeGroups"
								name="dojoOneAgeGroups"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoOneAgeGroups"
							></textarea>
						</div>
					</div>

					<hr inset />

					<div class="space-y-2">
						<h1
							class="font-semibold font-display uppercase text-san-marino-800 text-xl"
						>
							Informatii Dojo 2
						</h1>
						<div class="heading__line"></div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoTwoAddress"
								class="font-body text-xs"
								>Adresa</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoAddress"
								v-model="dojoTwoAddress"
								name="dojoTwoAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoTwoAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label for="dojoTwoCity" class="font-body text-xs"
								>Localitate</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoCity"
								v-model="dojoTwoCity"
								name="dojoTwoCity"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Localitate"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label for="dojoTwoCounty" class="font-body text-xs"
								>Judet / sector</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoCounty"
								v-model="dojoTwoCounty"
								name="dojoTwoCounty"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Judet / sector"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoTwoContactPerson"
								class="font-body text-xs"
								>Numar de telefon / persoana de contact /
								functie</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoContactPerson"
								v-model="dojoTwoContactPerson"
								name="dojoTwoContactPerson"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoTwoContactPerson"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoTwoEmailAddress"
								class="font-body text-xs"
								>Adresa de e-mail</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoEmailAddress"
								v-model="dojoTwoEmailAddress"
								name="dojoTwoEmailAddress"
								type="email"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoTwoEmailAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoTwoTatamiMP"
								class="font-body text-xs"
								>MP de Tatami</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoTwoTatamiMP"
								v-model="dojoTwoTatamiMP"
								name="dojoTwoTatamiMP"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoTwoTatamiMP"
							/>
						</div>
					</div>

					<div class="rounded-md shadow-sm -space-y-px">
						<div class="w-full">
							<label
								for="dojoTwoAgeGroups"
								class="font-body text-xs"
							>
								Grupe de varsta / program
							</label>
							<textarea
								:disabled="isReadOnly() == true"
								maxlength="750"
								rows="5"
								id="dojoTwoAgeGroups"
								v-model="dojoTwoAgeGroups"
								name="dojoTwoAgeGroups"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoTwoAgeGroups"
							></textarea>
						</div>
					</div>

					<hr inset />

					<div class="space-y-2">
						<h1
							class="font-semibold font-display uppercase text-san-marino-800 text-xl"
						>
							Informatii Dojo 3
						</h1>
						<div class="heading__line"></div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoThreeAddress"
								class="font-body text-xs"
								>Adresa</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeAddress"
								v-model="dojoThreeAddress"
								name="dojoThreeAddress"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoThreeAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-1/2 shadow-sm">
							<label for="dojoOneCity" class="font-body text-xs"
								>Localitate</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeCity"
								v-model="dojoThreeCity"
								name="dojoThreeCity"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Localitate"
							/>
						</div>
						<div class="w-1/2 shadow-sm">
							<label
								for="dojoThreeCounty"
								class="font-body text-xs"
								>Judet / sector</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeCounty"
								v-model="dojoThreeCounty"
								name="dojoThreeCounty"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								placeholder="Judet / sector"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoThreeContactPerson"
								class="font-body text-xs"
								>Numar de telefon / persoana de contact /
								functie</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeContactPerson"
								v-model="dojoThreeContactPerson"
								name="dojoThreeContactPerson"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoThreeContactPerson"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoThreeEmailAddress"
								class="font-body text-xs"
								>Adresa de e-mail</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeEmailAddress"
								v-model="dojoThreeEmailAddress"
								name="dojoThreeEmailAddress"
								type="email"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoThreeEmailAddress"
							/>
						</div>
					</div>

					<div class="flex flex-row rounded-md gap-2">
						<div class="w-full">
							<label
								for="dojoThreeTatamiMP"
								class="font-body text-xs"
								>MP de Tatami</label
							>
							<input
								:disabled="isReadOnly() == true"
								id="dojoThreeTatamiMP"
								v-model="dojoThreeTatamiMP"
								name="dojoThreeTatamiMP"
								type="text"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoThreeTatamiMP"
							/>
						</div>
					</div>

					<div class="rounded-md shadow-sm -space-y-px">
						<div class="w-full">
							<label
								for="dojoThreeAgeGroups"
								class="font-body text-xs"
							>
								Grupe de varsta / program
							</label>
							<textarea
								:disabled="isReadOnly() == true"
								maxlength="750"
								rows="5"
								id="dojoThreeAgeGroups"
								v-model="dojoThreeAgeGroups"
								name="dojoThreeAgeGroups"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.dojoThreeAgeGroups"
							></textarea>
						</div>
					</div>

					<hr inset />

					<div class="rounded-md shadow-sm -space-y-px">
						<div class="w-full">
							<label
								for="clubExtraInfo"
								class="font-body text-xs"
							>
								Informatii suplimentare despre club / asociatie
							</label>
							<textarea
								:disabled="isReadOnly() == true"
								maxlength="750"
								rows="5"
								id="clubExtraInfo"
								v-model="clubExtraInfo"
								name="clubExtraInfo"
								class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
								:placeholder="club.clubExtraInfo"
							></textarea>
						</div>
					</div>

					<div>
						<button
							type="submit"
							v-if="isReadOnly() == false"
							class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
						>
							Actualizeaza club
						</button>
					</div>
				</form>

				<button
					@click="deleteClub(club.id)"
					v-if="isReadOnly() == false"
					class="mt-2 w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
				>
					Sterge club
				</button>
			</div>
		</div>
	</div>
</template>
