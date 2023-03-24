<template>
	<DashboardNavBar />
	<section class="relative mt-7 mb-7">
		<div>
			<h1
				class="text-3xl md:text-4xl lg:text-[2.85rem] text-center font-display uppercase font-bold mb-3"
			>
				Panou de control
			</h1>
		</div>
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
							class="text-gray-500 text-2xl font-bold mt-3 mb-3 text-center"
						>
							{{ user.email }}</span
						>
						<span
							class="border-san-marino-500 border text-san-marino-500 font-bold p-1 mb-1 rounded w-auto text-center"
							>{{ userRole }}</span
						>

						<span
							v-if="euroRegionMod !== 0"
							class="border-bondi-blue-500 border text-bondi-blue-500 font-bold p-1 mb-1 rounded w-auto text-center uppercase"
							>Moderator Euroregiunea {{ euroRegionMod }}</span
						>

						<span
							v-if="categoriesMod !== ''"
							v-for="categoryMod in categoriesMod"
							class="border-pacific-blue-500 border text-pacific-blue-500 font-bold mb-1 p-1 rounded w-auto text-center uppercase"
							>Moderator {{ categoryMod }}</span
						>
					</div>
				</div>
			</div>
			<div
				id="changePass"
				v-if="userRole === 'USER'"
				v-bind:class="
					userRole === 'USER' && euroRegionMod === 0
						? 'col-span-2'
						: ''
				"
			>
				<div id="changepass__form">
					<div class="bg-white p-5 shadow-lg rounded-3xl">
						<h1
							class="font-display text-center mb-4 uppercase font-bold"
						>
							Schimbare parola
						</h1>

						<form @submit.prevent="changePass()"></form>
					</div>
				</div>
			</div>
			<div
				id="addAthlete"
				v-bind:class="userRole !== 'USER' ? 'col-span-2' : ''"
			>
				<div id="addathlete__form">
					<div
						v-if="userRole !== 'USER' || euroRegionMod != 0"
						class="bg-white p-5 shadow-lg rounded-3xl"
					>
						<h1
							class="font-display text-center mb-4 uppercase font-bold"
						>
							Adaugare sportiv in Euroregiuni
						</h1>
						<form @submit.prevent="addAthlete()" class="space-y-6">
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
									<label for="dateOfBirth" class="sr-only"
										>Data nasterii</label
									>
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
								<div class="w-1/2">
									<label
										for="athleteWeightCat"
										class="sr-only"
										>Categoria de greutate</label
									>
									<input
										id="athleteWeightCat"
										v-model="athleteWeightCat"
										name="athleteWeightCat"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Categoria de greutate"
									/>
								</div>

								<div class="w-1/2">
									<label for="athleteCNP" class="sr-only"
										>Cod numeric personal</label
									>
									<input
										id="athleteCNP"
										v-model="athleteCNP"
										name="athleteCNP"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cod numeric personal"
									/>
								</div>
							</div>

							<div class="flex flex-row rounded-md">
								<div class="w-full">
									<label
										for="examinationType"
										class="sr-only"
									>
										Tip examinare
									</label>
									<select
										id="examinationType"
										name="examinationType"
										v-model="examinationType"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
									>
										<option value="" disabled selected>
											Alege tipul examinarii
										</option>

										<option
											v-for="examType in examTypes"
											:value="examType.name"
										>
											{{ examType.name }}
										</option>
									</select>
								</div>
							</div>

							<div class="flex flex-row rounded-md">
								<div class="w-full">
									<label for="coachName" class="sr-only">
										Nume antrenor
									</label>
									<select
										id="coachName"
										v-model="coachName"
										name="coachName"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
									>
										<option value="" disabled selected>
											Alege antrenor
										</option>
										<option
											v-for="coach in coaches"
											:value="coach.fullName"
										>
											{{ coach.fullName }}
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
										placeholder="Admis"
									/>
								</div>

								<div class="w-1/2">
									<label for="euroRegiune" class="sr-only"
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
									class="w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
								>
									Insereaza sportiv
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div
			class="container mt-4"
			v-if="userRole !== 'USER' || euroRegionMod !== 0"
		>
			<div class="bg-white p-5 shadow-lg rounded-3xl">
				<div
					class="overflow-y-auto overflow-visible"
					id="athlete__list"
				>
					<h1
						class="font-display uppercase font-bold text-center mb-2"
					>
						Moderare sportivi
					</h1>
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="flex text-center font-body font-semibold text-sm mb-1 text-gray-500 space-x-2"
						>
							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByBelt"
										class="sr-only"
									>
										Cauta dupa centura
									</label>
									<input
										id="athleteSearchByBelt"
										name="athleteSearchByBelt"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa centura"
										@keyup="searchByBelt()"
									/>
								</div>
							</div>

							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByWeight"
										class="sr-only"
									>
										Cauta dupa greutate
									</label>
									<input
										id="athleteSearchByWeight"
										name="athleteSearchByWeight"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa greutate"
										@keyup="searchByWeight()"
									/>
								</div>
							</div>

							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByCoach"
										class="sr-only"
									>
										Cauta dupa antrenor
									</label>
									<input
										id="athleteSearchByCoach"
										name="athleteSearchByCoach"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa antrenor"
										@keyup="searchByCoach()"
									/>
								</div>
							</div>

							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByYOB"
										class="sr-only"
									>
										Cauta dupa anul nasterii
									</label>
									<input
										id="athleteSearchByYOB"
										name="athleteSearchByYOB"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa anul nasterii"
										@keyup="searchByYOB()"
									/>
								</div>
							</div>

							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByEuroregion"
										class="sr-only"
									>
										Cauta dupa euroregiune
									</label>
									<input
										id="athleteSearchByEuroregion"
										name="athleteSearchByEuroregion"
										v-model="athleteSearchByEuroregion"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa euroregiune"
										@keyup="searchByEuroregion()"
									/>
								</div>
							</div>

							<div
								class="flex flex-row justify-items-center rounded-md gap-2"
							>
								<div class="w-full">
									<label
										for="athleteSearchByExamType"
										class="sr-only"
									>
										Cauta dupa tipul examinarii
									</label>
									<input
										id="athleteSearchByExamType"
										name="athleteSearchByExamType"
										v-model="athleteSearchByExamType"
										type="text"
										class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
										placeholder="Cauta dupa tip examinare"
										@keyup="searchByExamType()"
									/>
								</div>
							</div>
						</DisclosurePanel>
					</Disclosure>
					<form @submit.prevent="">
						<table
							class="table-auto w-full text-black border-separate space-y-6 text-sm"
						>
							<thead
								class="bg-gray-300 text-black font-display sticky top-0"
							>
								<tr>
									<th class="p-3">Nume sportiv</th>
									<th class="p-3">Centura</th>
									<th class="p-3">Data nasterii</th>
									<th class="p-3">CNP</th>
									<th class="p-3">Cat. de greutate</th>
									<th class="p-3">Admis</th>
									<th class="p-3">Euroregiune</th>
									<th class="p-3">Tipul examinarii</th>
									<th class="p-3">Nume antrenor</th>
									<th class="p-3">Actiuni</th>
								</tr>
							</thead>
							<tbody
								v-for="athlete in athletes"
								class="font-body"
							>
								<tr
									:key="athlete.id"
									v-if="
										athlete.euroRegion === euroRegionMod ||
										userRole === 'ADMIN'
									"
								>
									<td class="p-3">
										<div class="flex align-items-center">
											<input
												type="checkbox"
												v-model="exportAthleteID"
												:value="athlete.id"
											/>
											<div class="ml-3">
												<div class="font-bold">
													{{ athlete.fullName }}
												</div>
												<div class="text-gray-500">
													{{ athlete.clubName }}
												</div>
											</div>
										</div>
									</td>
									<td class="p-3">
										{{ athlete.belt }}
									</td>

									<td class="p-3">
										{{ athlete.dateOfBirth }}
									</td>

									<td class="p-3">
										{{ athlete.CNP }}
									</td>

									<td class="p-3">
										{{ athlete.weightCat }}
									</td>

									<td class="p-3">
										{{ athlete.passedExam }}
									</td>

									<td class="p-3">
										Euroregiunea {{ athlete.euroRegion }}
									</td>

									<td class="p-3">
										{{ athlete.examinationType }}
									</td>

									<td class="p-3">
										{{ athlete.coachName }}
									</td>

									<td class="p-3 flex justify-center gap-2">
										<NuxtLink
											:to="`/dashboard/athlete/view/${athlete.id}`"
										>
											<ClientOnly>
												<font-awesome-icon
													icon="fa-solid fa-eye"
													class="cursor-pointer text-nepal-700"
												/>
											</ClientOnly>
										</NuxtLink>

										<ClientOnly>
											<font-awesome-icon
												icon="fa-solid fa-trash"
												class="text-red-500 cursor-pointer"
												@click="
													deleteAthlete(athlete.id)
												"
											/>
										</ClientOnly>
									</td>
								</tr>
							</tbody>
						</table>

						<!-- Select all -->
						<div class="flex gap-2">
							<label for="selectAll">
								Selecteaza toti atletii:
							</label>
							<input type="checkbox" @click="selectAll()" />
						</div>

						<div class="flex gap-2">
							<button
								type="submit"
								@click="exportData()"
								class="mt-2 w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
							>
								Creeaza export individual
							</button>
							<button
								type="submit"
								@click="exportList()"
								class="mt-2 w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-nepal-600 hover:bg-nepal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nepal-500"
							>
								Creeaza export lista
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<div
		ref="pdfSection"
		id="pdfSection"
		class="container text-xs hidden"
	></div>
</template>

<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { ref } from "vue";
import { exportToPDF } from "#imports";

const supabase = useSupabaseClient();

// Get all euro regions from the database.
const { data } = await useFetch("/api/euroregion/all");

// Get all athletes from the database.
const { data: athletes } = await useFetch("/api/athlete/all");

// Get all clubs from the database.
const { data: clubs } = await useFetch("/api/club/all");

// Get all coaches from the database.
const { data: coaches } = await useFetch("/api/coach/all");

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

const pdfSection = ref(null);

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's euroRegion number.
const euroRegionNumber = await getEuroregion(user.id);
const euroRegionMod = euroRegionNumber[0].euroRegionMod;

// Retrieve user's category moderator.
const categories = await getCategory(user.id);
const categoriesMod = categories[0].categoryMod;

// Examination types for athletes.
const examTypes = [
	{ id: 1, name: "U-12" },
	{ id: 2, name: "U-13" },
	{ id: 3, name: "U-14" },
	{ id: 4, name: "U-15" },
	{ id: 5, name: "U-16" },
];

let clubName = ref("");
let athleteName = ref("");
let athleteBelt = ref("");
let dateOfBirth = ref("");
let passedExam = ref("");
let euroRegiune = ref("");
let examinationType = ref("");
let coachName = ref("");
let athleteCNP = ref("");
let athleteWeightCat = ref("");
let tableBody = ref("");
let pdfHeader = ref("");

let athleteData = ref([]);

let athleteSearchByEuroregion = ref("");
let athleteSearchByExamType = ref("");

let exportAthleteID = ref([]);

onMounted(() => {
	clubName = clubName.value;
	athleteName = athleteName.value;
	athleteBelt = athleteBelt.value;
	dateOfBirth = dateOfBirth.value;
	passedExam = passedExam.value;
	euroRegiune = euroRegiune.value;
	examinationType = examinationType.value;
	coachName = coachName.value;
	athleteCNP = athleteCNP.value;
	athleteWeightCat = athleteWeightCat.value;

	athleteData = athleteData.value = [];

	tableBody = tableBody.value;
	pdfHeader = pdfHeader.value;

	athleteSearchByEuroregion = athleteSearchByEuroregion.value;
	athleteSearchByExamType = athleteSearchByExamType.value;
});

const selectAll = () => {
	console.log(athletes);
	if (exportAthleteID.value.length === athletes.length) {
		exportAthleteID.value = [];
	} else {
		exportAthleteID.value = athletes.value.map((athlete) => athlete.id);
	}
};

const exportList = async () => {
	if (exportAthleteID.value.length === 0) {
		alert("Selecteaza cel putin un atlet pentru a crea exportul.");
		return;
	}

	for (const exportAthId of exportAthleteID.value) {
		const { data: athlete } = await useFetch(
			`/api/athlete/export/${exportAthId}`
		);

		athleteData.push(athlete);
	}

	// loop through athlete data.
	athleteData.map((athlete, index) => {
		tableBody += `
			<tr class="border">
				<td class="p-2 border">${index + 1}</td>
				<td class="p-2 border">${athlete.value.fullName}</td>
				<td class="p-2 border">${athlete.value.clubName}</td>
				<td class="p-2 border">${athlete.value.coachName}</td>
				<td class="p-2 border">${athlete.value.euroRegion}</td>
				<td class="p-2 border">${athlete.value.dateOfBirth}</td>
				<td class="p-2 border">${athlete.value.athleteCNP}</td>
				<td calss="p-2 border">${athlete.value.examinationType}</td>
				<td class="p-2 border">${athlete.value.weightCat}</td>
				<td class="p-2 border">${athlete.value.belt}</td>
				<td class="p-2 border">${athlete.value.passedExam}</td>
			</tr>
		`;

		pdfHeader += `Euroregiunea - ${athlete.value.euroRegion}, clubul - ${athlete.value.clubName}, antrenor - ${athlete.value.coachName}<br />`;
	});

	const pdfContent = document.getElementById("pdfSection");
	pdfContent.classList.remove("hidden");

	pdfContent.innerHTML = `
			<div id="export__info">
				<p class="font-display">Fisa rezultate testare examinare tehnica</p>
				<p class="font-body">${pdfHeader}</p>
			</div>

			<br />

			<div id="athlete__table">
				<table class="table-auto border">
					<thead class="border">
						<tr>
							<th class="p-2 border">Nr. crt.</th>
							<th class="p-2 border">Nume si prenume</th>
							<th class="p-2 border">Club</th>
							<th class="p-2 border">Antrenor</th>
							<th class="p-2 border">Euroregiune</th>
							<th class="p-2 border">Data nasterii</th>
							<th class="p-2 border">CNP</th>
							<th class="p-2 border">Cat. de varsta</th>
							<th class="p-2 border">Cat. de greutate</th>
							<th class="p-2 border">Centura</th>
							<th class="p-2 border">Rezultat</th>
						</tr>
					</thead>
					<tbody class="border">${tableBody}</tbody>
				</table>
			</div>

			<div id="export__footer">
				<h3 class="font-display text-lg uppercase font-bold text-center">Director euroregiune,</h3>

				<p>&middot; Rezultatul testarii: ADMIS / RESPINS</p>

				<p>Pentru cei "ADMISI" se va specifica pondrea calificativelor</p>
			</div>
		`;

	try {
		await exportToPDF("Export atleti.pdf", pdfSection.value, {
			orientation: "p",
			format: "a1",
		}).then(() => {
			pdfContent.classList.add("hidden");
			pdfContent.innerHTML = "";
			athleteData = [];

			// Reload the page.
			location.reload();
		});
	} catch (error) {
		return console.error(error);
	}
};

const exportData = async () => {
	if (exportAthleteID.value.length === 0) {
		alert("Selecteaza cel putin un atlet pentru a crea exportul.");
		return;
	}

	for (const exportAthId of exportAthleteID.value) {
		await useFetch(`/api/athlete/export/${exportAthId}`).then(
			async (response) => {
				const {
					data: { value: exportedAthlete },
				} = response;

				const pdfContent = document.getElementById("pdfSection");
				pdfContent.classList.remove("hidden");

				pdfContent.innerHTML = `
				<div id="athlete__info">
					<p id="exampType" class="font-display">
						Fisa examinare:
						<span class="font-bold">
							${exportedAthlete.examinationType}
						</span>
						<br />
						Judoka:
						<span class="font-bold">${exportedAthlete.fullName}</span>
						<br />
						Data nasterii:
						<span class="font-bold">${exportedAthlete.dateOfBirth}</span>
						<br />
						Clubul:
						<span class="font-bold">${exportedAthlete.clubName}</span>
						<br />
						Euroregiunea:
						<span class="font-bold">${exportedAthlete.euroRegion}</span>
						<br />
						Profesor - antrenor:
						<span class="font-bold">${exportedAthlete.coachName}</span>
						<br />
						Centura obtinuta pana la data examinarii:
						<span class="font-bold">${exportedAthlete.belt}</span>
					</p>
				</div>

				<br />

				<div id="waza__tehnique">
					<table class="table-auto border">
						<thead class="border">
							<tr>
								<th class="p-2 border">Nr. crt.</th>
								<th class="p-2 border">Tehnica "ne waza"</th>
								<th class="p-2 border">Calificativ 1</th>
								<th class="p-2 border">Calificativ 2</th>
								<th class="p-2 border">Total</th>
							</tr>
						</thead>
						<tbody class="border">
							<tr class="border">
								<td class="p-2 border">1</td>
								<td class="p-2 border">Osae komi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Osae komi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Osae komi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<br />

				<div id="multiple__techniques">
					<table class="table-auto border">
						<thead class="border">
							<tr>
								<th class="p-2 border">Nr. crt.</th>
								<th class="p-2 border">Tehnica "Nage Waza"</th>
								<th class="p-2 border">Calificativ 1</th>
								<th class="p-2 border">Calificativ 2</th>
								<th class="p-2 border">Total</th>
							</tr>
						</thead>
						<tbody class="border">
							<tr class="border">
								<td class="p-2 border">1</td>
								<td class="p-2 border">Te waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Te waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Te waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border">2</td>
								<td class="p-2 border">Koshi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Koshi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Koshi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border">3</td>
								<td class="p-2 border">Ashi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Ashi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
							<tr class="border">
								<td class="p-2 border"></td>
								<td class="p-2 border">Ashi waza</td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
								<td class="p-2 border"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<br />
				<br />

				<div id="signatures" class="flex">
					<div id="euroregion__director" class="mr-10">
						<p class="text-center">Director Euroregiune</p>
						<p class="text-center">______________</p>
					</div>

					<div id="comission_presidents">
						<p class="text-center">Presedinti comisie</p>
						<p class="text-center">1. ________________________</p>
						<p class="text-center">2. ________________________</p>
					</div>
				</div>
			`;

				try {
					await exportToPDF(
						`${exportedAthlete.fullName}.pdf`,
						pdfSection.value,
						{
							orientation: "p",
							format: "a4",
						}
					).then(() => {
						pdfContent.classList.add("hidden");
						pdfContent.innerHTML = "";

						// Reload the page.
						location.reload();
					});
				} catch (error) {
					return console.error(error);
				}
			}
		);
	}
};

const deleteAthlete = async (id) =>
	await useFetch(`/api/athlete/delete/${id}`, {
		method: "DELETE",
	})
		.then(() => {
			// Refresh page.
			location.reload();
		})
		.catch((error) => {
			console.error(error);
		});

const addAthlete = async () => {
	return await $fetch("api/athlete", {
		method: "POST",
		body: {
			clubName: clubName,
			fullName: athleteName,
			dateOfBirth: dateOfBirth,
			passedExam: passedExam,
			belt: athleteBelt,
			euroRegion: euroRegiune,
			examinationType: examinationType,
			coachName: coachName,
			athleteCNP: athleteCNP,
			weightCat: athleteWeightCat,
		},
	})
		.then((response) => {
			console.log(response);

			if (response.code === "[error]") {
				console.log(response.message);
				return;
			}

			// Refresh page.
			location.reload();

			return console.log(
				`athlete [${athleteName}] added successfully in our database.`
			);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error.statusMessage}`);
		});
};

const searchByBelt = () => {
	const input = document.getElementById("athleteSearchByBelt");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[1];
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

const searchByEuroregion = () => {
	const input = document.getElementById("athleteSearchByEuroregion");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[6];
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

const searchByYOB = () => {
	const input = document.getElementById("athleteSearchByYOB");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[2];
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

const searchByExamType = () => {
	const input = document.getElementById("athleteSearchByExamType");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[7];
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

const searchByWeight = () => {
	const input = document.getElementById("athleteSearchByWeight");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[4];
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

const searchByCoach = () => {
	const input = document.getElementById("athleteSearchByCoach");
	const filter = input.value.toUpperCase();
	const table = document.getElementById("athlete__list");
	const tr = table.getElementsByTagName("tr");

	for (let i = 0; i < tr.length; i++) {
		const td = tr[i].getElementsByTagName("td")[8];
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

watchEffect(() => {
	if (!user) {
		return navigateTo("/sign-in");
	}
});

definePageMeta({
	middleware: "auth",
});
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

tr td:nth-child(n + 10),
tr th:nth-child(n + 10) {
	border-radius: 0 0.625rem 0.625rem 0;
}

tr td:nth-child(1),
tr th:nth-child(1) {
	border-radius: 0.625rem 0 0 0.625rem;
}
</style>
