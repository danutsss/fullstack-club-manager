<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { LockClosedIcon } from "@heroicons/vue/20/solid";
import { ref, onMounted } from "vue";

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
	clubName = clubName.value = "";
	clubCounty = clubCounty.value = "";
	clubCity = clubCity.value = "";
	clubAddress = clubAddress.value = "";
	zipCode = zipCode.value = "";
	clubContactPerson = clubContactPerson.value = "";
	clubEmail = clubEmail.value = "";
	clubAfiliatFRJ = clubAfiliatFRJ.value = "";
	clubAfiliatAJJ = clubAfiliatAJJ.value = "";
	clubCoachOneName = clubCoachOneName.value = "";
	clubCoachTwoName = clubCoachTwoName.value = "";
	clubCoachThreeName = clubCoachThreeName.value = "";
	clubWebAddress = clubWebAddress.value = "";
	clubFbAddress = clubFbAddress.value = "";
	clubSocialAccounts = clubSocialAccounts.value = "";
	dojoOneAddress = dojoOneAddress.value = "";
	dojoOneCity = dojoOneCity.value = "";
	dojoOneCounty = dojoOneCounty.value = "";
	dojoOneContactPerson = dojoOneContactPerson.value = "";
	dojoOneEmailAddress = dojoOneEmailAddress.value = "";
	dojoOneTatamiMP = dojoOneTatamiMP.value = "";
	dojoOneAgeGroups = dojoOneAgeGroups.value = "";
	dojoTwoAddress = dojoTwoAddress.value = "";
	dojoTwoCity = dojoTwoCity.value = "";
	dojoTwoCounty = dojoTwoCounty.value = "";
	dojoTwoContactPerson = dojoTwoContactPerson.value = "";
	dojoTwoEmailAddress = dojoTwoEmailAddress.value = "";
	dojoTwoTatamiMP = dojoTwoTatamiMP.value = "";
	dojoTwoAgeGroups = dojoTwoAgeGroups.value = "";
	dojoThreeAddress = dojoThreeAddress.value = "";
	dojoThreeCity = dojoThreeCity.value = "";
	dojoThreeCounty = dojoThreeCounty.value = "";
	dojoThreeContactPerson = dojoThreeContactPerson.value = "";
	dojoThreeEmailAddress = dojoThreeEmailAddress.value = "";
	dojoThreeTatamiMP = dojoThreeTatamiMP.value = "";
	dojoThreeAgeGroups = dojoThreeAgeGroups.value = "";
	clubExtraInfo = clubExtraInfo.value = "";
});

const addClub = async () => {
	return await $fetch("/api/club", {
		method: "POST",
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
			console.log(
				`${clubName} has been added successfully into our database for verification.`
			);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error}`);
		});
};
</script>

<template>
	<LayoutNavBar />

	<LayoutHeader>
		<template v-slot:main-text>Cluburi Judo</template>
		<template v-slot:secondary-text
			>Contribuie la crearea unei liste cu toate informatiile despre
			cluburile si asociatiile de Judo din Romania.</template
		>
		<template v-slot:header-img>
			<img
				class="sm:w-3/4 w-9/12 sm:h-3/4 mt-2 mb-2 shadow-2xl aspect-square rotate-3 rounded-2xl bg-zinc-100 dark:bg-zinc-800"
				src="~/assets/images/FRJUDO.png"
				alt="Judo"
				loading="lazy"
				style="color: transparent"
				decoding="async"
			/>
		</template>
	</LayoutHeader>

	<section class="container flex flex-col justify-center items-center">
		<div id="addClubText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center lg:text-left mb-3"
			>
				Actualizare cluburi & asociatii
			</h1>
			<div class="heading__line"></div>
		</div>

		<div id="addClubForm" class="mt-4">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-full rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form @submit.prevent="addClub()" class="space-y-6">
								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label for="clubName" class="sr-only"
											>Nume asociatie / club
											sportiv</label
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
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label for="clubAddress" class="sr-only"
											>Adresa asociatie / club
											sportiv</label
										>
										<input
											id="clubAddress"
											v-model="clubAddress"
											name="clubAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa asociatie / club sportiv"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="clubCity" class="sr-only"
											>Localitate</label
										>
										<input
											id="clubCity"
											v-model="clubCity"
											name="clubCity"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Localitate"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label for="clubCounty" class="sr-only"
											>Judet / sector</label
										>
										<input
											id="clubCounty"
											v-model="clubCounty"
											name="clubCounty"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Judet / sector"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label for="zipCode" class="sr-only"
											>Cod postal</label
										>
										<input
											id="zipCode"
											v-model="zipCode"
											name="zipCode"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Cod postal"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="clubContactPerson"
											class="sr-only"
											>Numar de telefon / persoana de
											contact / functie</label
										>
										<input
											id="clubContactPerson"
											v-model="clubContactPerson"
											name="clubContactPerson"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar de telefon / persoana de contact / functie"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label for="clubEmail" class="sr-only"
											>Adresa de e-mail club /
											asociatie</label
										>
										<input
											id="clubEmail"
											v-model="clubEmail"
											name="clubEmail"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail club / asociatie"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="clubAfiliatFRJ"
											class="sr-only"
											>Afiliat Federatia Romana de
											Judo?</label
										>
										<input
											id="clubAfiliatFRJ"
											v-model="clubAfiliatFRJ"
											name="clubAfiliatFRJ"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Afiliat Federatia Romana de Judo?"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label
											for="clubAfiliatAJJ"
											class="sr-only"
											>Afiliat Asociatia Judeteana de
											Judo?</label
										>
										<input
											id="clubAfiliatAJJ"
											v-model="clubAfiliatAJJ"
											name="clubAfiliatAJJ"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Afiliat Asociatia Judeteana de Judo?"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="clubCoachOneName"
											class="sr-only"
											>Nume antrenor 1</label
										>
										<input
											id="clubCoachOneName"
											v-model="clubCoachOneName"
											name="clubCoachOneName"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nume antrenor 1"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label
											for="clubCoachTwoName"
											class="sr-only"
											>Nume antrenor 2</label
										>
										<input
											id="clubCoachTwoName"
											v-model="clubCoachTwoName"
											name="clubCoachTwoName"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nume antrenor 2"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="clubCoachThreeName"
											class="sr-only"
											>Nume antrenor 3</label
										>
										<input
											id="clubCoachThreeName"
											v-model="clubCoachThreeName"
											name="clubCoachThreeName"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nume antrenor 3"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="clubWebAddress"
											class="sr-only"
											>Adresa web</label
										>
										<input
											id="clubWebAddress"
											v-model="clubWebAddress"
											name="clubWebAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa web"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label
											for="clubFbAddress"
											class="sr-only"
											>Facebook</label
										>
										<input
											id="clubFbAddress"
											v-model="clubFbAddress"
											name="clubFbAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Facebook"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="clubSocialAccounts"
											class="sr-only"
										>
											Alte conturi de socializare
											(Instagram, Snapchat etc.)
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="clubSocialAccounts"
											v-model="clubSocialAccounts"
											name="clubSocialAccounts"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Alte conturi de socializare (Instagram, Snapchat etc.)"
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
											class="sr-only"
											>Adresa</label
										>
										<input
											id="dojoOneAddress"
											v-model="dojoOneAddress"
											name="dojoOneAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="dojoOneCity" class="sr-only"
											>Localitate</label
										>
										<input
											id="dojoOneCity"
											v-model="dojoOneCity"
											name="dojoOneCity"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Localitate"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label
											for="dojoOneCounty"
											class="sr-only"
											>Judet / sector</label
										>
										<input
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
											class="sr-only"
											>Numar de telefon / persoana de
											contact / functie</label
										>
										<input
											id="dojoOneContactPerson"
											v-model="dojoOneContactPerson"
											name="dojoOneContactPerson"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar de telefon / persoana de contact / functie "
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoOneEmailAddress"
											class="sr-only"
											>Adresa de e-mail</label
										>
										<input
											id="dojoOneEmailAddress"
											v-model="dojoOneEmailAddress"
											name="dojoOneEmailAddress"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoOneTatamiMP"
											class="sr-only"
											>MP de Tatami</label
										>
										<input
											id="dojoOneTatamiMP"
											v-model="dojoOneTatamiMP"
											name="dojoOneTatamiMP"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="MP de Tatami"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="dojoOneAgeGroups"
											class="sr-only"
										>
											Grupe de varsta / program
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="dojoOneAgeGroups"
											v-model="dojoOneAgeGroups"
											name="dojoOneAgeGroups"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Grupe de varsta / program"
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
											class="sr-only"
											>Adresa</label
										>
										<input
											id="dojoTwoAddress"
											v-model="dojoTwoAddress"
											name="dojoTwoAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="dojoTwoCity" class="sr-only"
											>Localitate</label
										>
										<input
											id="dojoTwoCity"
											v-model="dojoTwoCity"
											name="dojoTwoCity"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Localitate"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label
											for="dojoTwoCounty"
											class="sr-only"
											>Judet / sector</label
										>
										<input
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
											class="sr-only"
											>Numar de telefon / persoana de
											contact / functie</label
										>
										<input
											id="dojoTwoContactPerson"
											v-model="dojoTwoContactPerson"
											name="dojoTwoContactPerson"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar de telefon / persoana de contact / functie "
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoTwoEmailAddress"
											class="sr-only"
											>Adresa de e-mail</label
										>
										<input
											id="dojoTwoEmailAddress"
											v-model="dojoTwoEmailAddress"
											name="dojoTwoEmailAddress"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoTwoTatamiMP"
											class="sr-only"
											>MP de Tatami</label
										>
										<input
											id="dojoTwoTatamiMP"
											v-model="dojoTwoTatamiMP"
											name="dojoTwoTatamiMP"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="MP de Tatami"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="dojoTwoAgeGroups"
											class="sr-only"
										>
											Grupe de varsta / program
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="dojoTwoAgeGroups"
											v-model="dojoTwoAgeGroups"
											name="dojoTwoAgeGroups"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Grupe de varsta / program"
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
											class="sr-only"
											>Adresa</label
										>
										<input
											id="dojoThreeAddress"
											v-model="dojoThreeAddress"
											name="dojoThreeAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="dojoOneCity" class="sr-only"
											>Localitate</label
										>
										<input
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
											class="sr-only"
											>Judet / sector</label
										>
										<input
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
											class="sr-only"
											>Numar de telefon / persoana de
											contact / functie</label
										>
										<input
											id="dojoThreeContactPerson"
											v-model="dojoThreeContactPerson"
											name="dojoThreeContactPerson"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar de telefon / persoana de contact / functie "
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoThreeEmailAddress"
											class="sr-only"
											>Adresa de e-mail</label
										>
										<input
											id="dojoThreeEmailAddress"
											v-model="dojoThreeEmailAddress"
											name="dojoThreeEmailAddress"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="dojoThreeTatamiMP"
											class="sr-only"
											>MP de Tatami</label
										>
										<input
											id="dojoThreeTatamiMP"
											v-model="dojoThreeTatamiMP"
											name="dojoThreeTatamiMP"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="MP de Tatami"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="dojoThreeAgeGroups"
											class="sr-only"
										>
											Grupe de varsta / program
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="dojoThreeAgeGroups"
											v-model="dojoThreeAgeGroups"
											name="dojoThreeAgeGroups"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Grupe de varsta / program"
										></textarea>
									</div>
								</div>

								<hr inset />

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="clubExtraInfo"
											class="sr-only"
										>
											Informatii suplimentare despre club
											/ asociatie
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="clubExtraInfo"
											v-model="clubExtraInfo"
											name="clubExtraInfo"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Informatii suplimentare pentru promovarea clubului / asociatiei"
										></textarea>
									</div>
								</div>

								<div>
									<button
										type="submit"
										class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
									>
										<span
											class="absolute left-0 inset-y-0 flex items-center pl-3"
										>
											<LockClosedIcon
												class="h-5 w-5 text-nepal-500 group-hover:text-nepal-400"
												aria-hidden="true"
											/>
										</span>
										Trimite formular
									</button>
								</div>
							</form>
						</DisclosurePanel>
					</Disclosure>
				</div>
			</div>
		</div>
	</section>

	<LayoutFooter />
</template>

<style scoped>
.heading__line::before {
	content: "";
	width: 10rem;
	height: 0.1rem;
	display: block;
	margin: 0 auto;
	background-color: #4c6c88;
}

.heading__line::after {
	content: "";
	width: 2rem;
	padding-top: 0.5rem;
	height: 0.2rem;
	display: block;
	margin: 0 auto;
	margin-bottom: 1rem;
	background-color: #4c6c88;
}
</style>
