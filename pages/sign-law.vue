<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { ref, onMounted } from "vue";

let clubName = ref("");
let fullName = ref("");
let emailAddress = ref("");
let phoneNo = ref("");
let noRegisteredAthletes = ref("");
let noParticipatingAthletes = ref("");
let noRegisteredJuniors = ref("");
let noParticipatingJuniors = ref("");

let hasSuccess = ref(false);
let successMessage = ref("");

let hasError = ref(false);
let errorMessage = ref("");

useHead({
	title: "Semneaza Legea nr. 322/2022 @ AJJ.RO",
	meta: [
		{
			name: "description",
			content:
				"Semneaza Legea nr. 322/2022 pentru completarea Legii educaţiei fizice şi sportului nr. 69/2000",
		},
		{
			name: "keywords",
			content:
				"asociatii judetene de judo, Romania, legea nr. 322/2022, AJJ.RO, educatie fizica si sport, semnare lege, semnare legea nr. 322/2022",
		},
		{
			name: "author",
			content: "Matei Nicolae - Daniel @ AJJ.RO",
		},
		{
			name: "robots",
			content: "index, follow",
		},
		{
			name: "googlebot",
			content: "index, follow",
		},
		{
			name: "google",
			content: "nositelinkssearchbox",
		},
		{
			name: "google",
			content: "notranslate",
		},
	],
});

onMounted(() => {
	clubName = clubName.value;
	fullName = fullName.value;
	emailAddress = emailAddress.value;
	phoneNo = phoneNo.value;
	noRegisteredAthletes = noRegisteredAthletes.value;
	noParticipatingAthletes = noParticipatingAthletes.value;
	noRegisteredJuniors = noRegisteredJuniors.value;
	noParticipatingJuniors = noParticipatingJuniors.value;
});

const signLaw = async () => {
	return await $fetch("/api/law", {
		method: "POST",
		body: {
			clubName,
			fullName,
			emailAddress,
			phoneNo,
			noRegisteredAthletes,
			noParticipatingAthletes,
			noRegisteredJuniors,
			noParticipatingJuniors,
		},
	})
		.then((response) => {
			if (response.code === "[error]") {
				hasError.value = true;
				hasSuccess.value = false;
				return (errorMessage.value = response.message);
			}

			hasSuccess.value = true;
			hasError.value = false;
			return (successMessage.value = response.message);
		})
		.catch((error) => {
			hasError.value = true;
			hasSuccess.value = false;
			return (errorMessage.value = error.statusMessage);
		});
};
</script>

<template>
	<LayoutNavBar />

	<section class="container flex flex-col justify-center items-center p-6">
		<div id="signLawText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center mb-3"
			>
				Legea 322
			</h1>
			<div class="heading__line"></div>

			<h3 class="font-body font-semibold text-center mb-3">
				Legea nr. 322/2022 pentru completarea Legii educaţiei fizice şi
				sportului nr. 69/2000
			</h3>
		</div>
		<div id="signLawForm">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-full rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form @submit.prevent="signLaw()" class="space-y-5">
								<ErrorMessage
									v-if="hasError"
									:errorMessage="errorMessage"
								/>

								<SuccessMessage
									v-if="hasSuccess"
									:successMessage="successMessage"
								/>
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

								<hr inset />

								<div class="space-y-2">
									<h1
										class="font-semibold font-display uppercase text-san-marino-800 text-xl"
									>
										Persoana de contact
									</h1>
									<div class="heading__line"></div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label for="fullName" class="sr-only"
											>Nume complet</label
										>
										<input
											id="fullName"
											v-model="fullName"
											name="fullName"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nume complet"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="emailAddress"
											class="sr-only"
											>Adresa de e-mail</label
										>
										<input
											id="emailAddress"
											v-model="emailAddress"
											name="emailAddress"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label for="phoneNo" class="sr-only"
											>Numar de telefon</label
										>
										<input
											id="phoneNo"
											v-model="phoneNo"
											name="phoneNo"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar de telefon"
										/>
									</div>
								</div>

								<hr inset />

								<div class="space-y-2">
									<h1
										class="font-semibold font-display uppercase text-san-marino-800 text-xl"
									>
										Copii nascuti intre anii 2010 - 2012
										(pentru anul 2023)
									</h1>
									<div class="heading__line"></div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="noRegisteredAthletes"
											class="sr-only"
											>Numar total de sportivi
											legitimati</label
										>
										<input
											id="noRegisteredAthletes"
											v-model="noRegisteredAthletes"
											name="noRegisteredAthletes"
											type="number"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar total de sportivi legitimati"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="noParticipatingAthletes"
											class="sr-only"
											>Numar total sportivi participanti
											la pregatire, competitii sportive
											nationale si internationale
											oficiale</label
										>
										<input
											id="noParticipatingAthletes"
											v-model="noParticipatingAthletes"
											name="noParticipatingAthletes"
											type="number"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar total sportivi participanti la pregatire, competitii sportive nationale si internationale oficiale"
										/>
									</div>
								</div>

								<hr inset />

								<div class="space-y-2">
									<h1
										class="font-semibold font-display uppercase text-san-marino-800 text-xl"
									>
										Juniori nascuti intre anii 2003 - 2009
										(pentru anul 2023)
									</h1>
									<div class="heading__line"></div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="noRegisteredJuniors"
											class="sr-only"
											>Numar total de sportivi
											legitimati</label
										>
										<input
											id="noRegisteredJuniors"
											v-model="noRegisteredJuniors"
											name="noRegisteredJuniors"
											type="number"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar total de sportivi legitimati"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="noParticipatingJuniors"
											class="sr-only"
											>Numar total sportivi participanti
											la pregatire, competitii sportive
											nationale si internationale
											oficiale</label
										>
										<input
											id="noParticipatingJuniors"
											v-model="noParticipatingJuniors"
											name="noParticipatingJuniors"
											type="number"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Numar total sportivi participanti la pregatire, competitii sportive nationale si internationale oficiale"
										/>
									</div>
								</div>

								<div>
									<button
										type="submit"
										class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
									>
										Semneaza
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
