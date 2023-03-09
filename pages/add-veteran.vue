<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { LockClosedIcon } from "@heroicons/vue/20/solid";
import { ref, onMounted } from "vue";

let firstName = ref("");
let lastName = ref("");
let phoneNo = ref("");
let homeAddress = ref("");
let dateOfBirth = ref("");
let weightCat = ref("");
let ageCat = ref("");
let gradation = ref("");
let emailAddress = ref("");

onMounted(() => {
	firstName = firstName.value;
	lastName = lastName.value;
	phoneNo = phoneNo.value;
	homeAddress = homeAddress.value;
	dateOfBirth = dateOfBirth.value;
	weightCat = weightCat.value;
	ageCat = ageCat.value;
	gradation = gradation.value;
	emailAddress = emailAddress.value;
});

const addVeteran = async () => {
	return await $fetch("/api/veteran", {
		method: "POST",
		body: {
			firstName,
			lastName,
			phoneNo,
			homeAddress,
			dateOfBirth,
			weightCat,
			ageCat,
			gradation,
			emailAddress,
		},
	})
		.then((response) => {
			console.log(response);

			if (response.code === "[error]") {
				console.log(response.message);
				return;
			}

			return console.log(
				`Veteran [${firstName} ${lastName}] has been added successfully in our database.`
			);
		})
		.catch((error) => {
			console.log(`[error occured]: ${error.statusMessage}`);
		});
};
</script>

<template>
	<LayoutNavBar />

	<LayoutHeader>
		<template v-slot:main-text>Veterani Judo</template>
		<template v-slot:secondary-text
			>Unim toti veteranii de Judo ai Romaniei!</template
		>

		<template v-slot:header-img>
			<img
				class="sm:w-3/4 sm:h-3/4 mt-2 mb-2 shadow-2xl aspect-square rotate-3 rounded-2xl bg-zinc-100 dark:bg-zinc-800"
				src="~/assets/images/veterans.jpg"
				alt="Judo"
				loading="lazy"
				style="color: transparent"
				decoding="async"
			/>
		</template>
	</LayoutHeader>

	<section class="container flex flex-col justify-center items-center">
		<div id="addVeteranText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center lg:text-left mb-3"
			>
				Actualizare veterani
			</h1>
			<div class="heading__line"></div>
		</div>

		<div id="addVeteranForm" class="mt-4">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-full rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form
								@submit.prevent="addVeteran()"
								class="space-y-6"
							>
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

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
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

									<div class="w-1/2 shadow-sm">
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
									<div class="w-full shadow-sm">
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

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full shadow-sm">
										<label
											for="homeAddress"
											class="sr-only"
										>
											Domiciliu
										</label>
										<input
											id="homeAddress"
											v-model="homeAddress"
											name="homeAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Domiciliu"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2 shadow-sm">
										<label for="ageCat" class="sr-only">
											Categoria de varsta
										</label>
										<input
											id="ageCat"
											v-model="ageCat"
											name="ageCat"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Categoria de varsta"
										/>
									</div>

									<div class="w-1/2 shadow-sm">
										<label for="weightCat" class="sr-only">
											Categoria de greutate
										</label>
										<input
											id="weightCat"
											v-model="weightCat"
											name="weightCat"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Categoria de greutate"
										/>
									</div>
								</div>

								<div class="rounded-md shadow-sm -space-y-px">
									<div class="w-full shadow-sm">
										<label for="gradation" class="sr-only">
											Gradatie
										</label>
										<input
											id="gradation"
											v-model="gradation"
											name="gradation"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Gradatie"
										/>
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
										Trimite veteran
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
