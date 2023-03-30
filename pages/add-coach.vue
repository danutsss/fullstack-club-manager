<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { ref, onMounted } from "vue";

// Get all clubs from the database.
const { data: clubs } = await useFetch("/api/club/all");

let firstName = ref("");
let lastName = ref("");
let phoneNo = ref("");
let emailAddress = ref("");
let coachNationality = ref("");
let dateOfBirth = ref("");
let placeOfWork = ref("");
let domainOfWork = ref("");
let workResponsabilities = ref("");
let workPeriod = ref("");
let occupiedFunction = ref("");
let coachQualification = ref("");
let obtainedDegree = ref("");
let otherSkills = ref("");
let blackBelt = ref("");
let coachPublications = ref("");
let coachProfessionalActivity = ref("");
let coachResults = ref("");
let coachExtraInfo = ref("");
let coachClub = ref("");

let hasError = ref(false);
let errorMessage = ref("");

let hasSuccess = ref(false);
let successMessage = ref("");

onMounted(() => {
	firstName = firstName.value;
	lastName = lastName.value;
	phoneNo = phoneNo.value;
	emailAddress = emailAddress.value;
	coachNationality = coachNationality.value;
	coachClub = coachClub.value;
	dateOfBirth = dateOfBirth.value;
	placeOfWork = placeOfWork.value;
	domainOfWork = domainOfWork.value;
	workResponsabilities = workResponsabilities.value;
	workPeriod = workPeriod.value;
	occupiedFunction = occupiedFunction.value;
	coachQualification = coachQualification.value;
	obtainedDegree = obtainedDegree.value;
	otherSkills = otherSkills.value;
	blackBelt = blackBelt.value;
	coachPublications = coachPublications.value;
	coachProfessionalActivity = coachProfessionalActivity.value;
	coachResults = coachResults.value;
	coachExtraInfo = coachExtraInfo.value;
});

useHead({
	title: "Adauga antrenor @ AJJ.RO",
	meta: [
		{
			name: "description",
			content:
				"Adauga un antrenor in baza de date a Asociatiilor Judetene de Judo din Romania.",
		},
		{
			name: "keywords",
			content:
				"asociatii judetene de judo, Romania, antrenor judo, adauga antrenor, AJJ.RO, judo, veterani judo, antrenori judo, cluburi judo, judoka, sportivi judo",
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

const addCoach = async () => {
	return await $fetch("/api/coach", {
		method: "POST",
		body: {
			fullName: `${firstName} ${lastName}`,
			phoneNo,
			emailAddress,
			coachNationality,
			coachClub,
			dateOfBirth,
			placeOfWork,
			domainOfWork,
			workResponsabilities,
			workPeriod,
			occupiedFunction,
			coachQualification,
			obtainedDegree,
			otherSkills,
			blackBelt,
			coachPublications,
			coachProfessionalActivity,
			coachResults,
			coachExtraInfo,
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

	<LayoutHeader>
		<template v-slot:main-text>Antrenori Judo</template>
		<template v-slot:secondary-text
			>Contribuie la crearea unei liste cu toti antrenorii de Judo din
			Romania.</template
		>
		<template v-slot:header-img>
			<img
				class="sm:w-3/4 sm:h-3/4 mt-2 mb-2 shadow-2xl aspect-square rotate-3 rounded-2xl bg-zinc-100 dark:bg-zinc-800"
				src="~/assets/images/judo-time.jpg"
				alt="Judo"
				loading="lazy"
				style="color: transparent"
				decoding="async"
			/>
		</template>
	</LayoutHeader>

	<section class="container flex flex-col justify-center items-center">
		<div id="addCoachText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center lg:text-left mb-3"
			>
				Actualizare antrenori
			</h1>
			<div class="heading__line"></div>
		</div>

		<div id="addCoachForm" class="mt-4">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-full rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form
								@submit.prevent="addCoach()"
								class="space-y-5"
							>
								<ErrorMessage
									v-if="hasError"
									:errorMessage="errorMessage"
								/>

								<SuccessMessage
									v-if="hasSuccess"
									:successMessage="successMessage"
								/>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="lastName" class="sr-only"
											>Nume de familie</label
										>
										<input
											id="lastName"
											v-model="lastName"
											name="lastName"
											type="text"
											autocomplete="additional-name"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nume de familie"
										/>
									</div>
									<div class="w-1/2 shadow-sm">
										<label for="firstName" class="sr-only"
											>Prenume</label
										>
										<input
											id="firstName"
											v-model="firstName"
											name="firstName"
											type="text"
											autocomplete="additional-name"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Prenume"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label for="phoneNo" class="sr-only">
											Numar de telefon
										</label>
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

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="emailAddress"
											class="sr-only"
										>
											Adresa de e-mail
										</label>
										<input
											id="emailAddress"
											v-model="emailAddress"
											name="emailAddress"
											type="email"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label for="coachClub" class="sr-only"
											>Club</label
										>
										<select
											id="coachClub"
											v-model="coachClub"
											name="coachClub"
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
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="coachNationality"
											class="sr-only"
										>
											Nationalitate
										</label>
										<input
											id="coachNationality"
											v-model="coachNationality"
											name="coachNationality"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Nationalitate"
										/>
									</div>

									<div class="w-1/2 shadow-sm">
										<label
											for="dateOfBirth"
											class="sr-only"
										>
											Data nasterii
										</label>
										<input
											id="dateOfBirth"
											v-model="dateOfBirth"
											name="dateOfBirth"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Data nasterii"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="placeOfWork"
											class="sr-only"
										>
											Locul de munca
										</label>
										<input
											id="placeOfWork"
											v-model="placeOfWork"
											name="placeOfWork"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Locul de munca"
										/>
									</div>

									<div class="w-1/2 shadow-sm">
										<label
											for="domainOfWork"
											class="sr-only"
										>
											Domeniul de munca
										</label>
										<input
											id="domainOfWork"
											v-model="domainOfWork"
											name="domainOfWork"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Domeniul de munca"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="workResponsabilities"
											class="sr-only"
										>
											Responsabilitati
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="workResponsabilities"
											v-model="workResponsabilities"
											name="workResponsabilities"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Responsabilitati la locul de munca"
										></textarea>
									</div>
								</div>

								<hr inset />

								<div class="space-y-2">
									<h1
										class="font-semibold font-display uppercase text-san-marino-800 text-xl"
									>
										Experienta profesionala
									</h1>
									<div class="heading__line"></div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label
											for="occupiedFunction"
											class="sr-only"
										>
											Functie
										</label>
										<input
											id="occupiedFunction"
											v-model="occupiedFunction"
											name="occupiedFunction"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Functie"
										/>
									</div>

									<div class="w-1/2 shadow-sm">
										<label
											for="coachQualification"
											class="sr-only"
										>
											Calificare
										</label>
										<input
											id="coachQualification"
											v-model="coachQualification"
											name="coachQualification"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Calificare"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label for="workPeriod" class="sr-only">
											Perioada de munca (pana in prezent)
										</label>
										<input
											id="workPeriod"
											v-model="workPeriod"
											name="workPeriod"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Perioada de munca (pana in prezent)"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="obtainedDegree"
											class="sr-only"
										>
											Diploma
										</label>
										<input
											id="obtainedDegree"
											v-model="obtainedDegree"
											name="obtainedDegree"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Diploma"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="otherSkills"
											class="sr-only"
										>
											Alte competente si aptitudini
											rezultate pe plan sportiv
										</label>
										<textarea
											maxlength="750"
											rows="5"
											id="otherSkills"
											v-model="otherSkills"
											name="otherSkills"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Alte competente si aptitudini rezultate pe plan sportiv"
										></textarea>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label for="blackBelt" class="sr-only">
											Purtator al centurii negre?
										</label>
										<input
											id="blackBelt"
											v-model="blackBelt"
											name="blackBelt"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Purtator al centurii negre?"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="coachPublications"
											class="sr-only"
										>
											Publicatii, activitate stiintifica
										</label>
										<textarea
											maxlength="1500"
											rows="5"
											id="coachPublications"
											v-model="coachPublications"
											name="coachPublications"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Publicatii, activitate stiintifica"
										></textarea>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="coachProfessionalActivity"
											class="sr-only"
										>
											Activitatea profesionala in cadrul
											Federatiei Romane de Judo
										</label>
										<textarea
											maxlength="1500"
											rows="5"
											id="coachProfessionalActivity"
											v-model="coachProfessionalActivity"
											name="coachProfessionalActivity"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Activitatea profesionala in cadrul Federatiei Romane de Judo"
										></textarea>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="coachResults"
											class="sr-only"
										>
											Rezultate in activitatea de profesor
											/ antrenor in cadrul clubului si
											lotului national
										</label>
										<textarea
											maxlength="1500"
											rows="5"
											id="coachResults"
											v-model="coachResults"
											name="coachResults"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Rezultate in activitatea de profesor / antrenor in cadrul clubului si lotului national"
										></textarea>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full">
										<label
											for="coachExtraInfo"
											class="sr-only"
										>
											Informatii suplimentare (premii,
											distinctii, decoratii)
										</label>
										<textarea
											maxlength="1500"
											rows="5"
											id="coachExtraInfo"
											v-model="coachExtraInfo"
											name="coachExtraInfo"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Informatii suplimentare (premii, distinctii, decoratii)"
										></textarea>
									</div>
								</div>

								<div>
									<button
										type="submit"
										class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
									>
										Trimite antrenor
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
