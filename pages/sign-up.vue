<template>
	<LayoutNavBar />

	<section
		class="container flex flex-col justify-center items-center h-screen"
	>
		<div id="signLawText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center mb-3"
			>
				Inregistreaza un cont nou
			</h1>
			<div class="heading__line"></div>

			<h3 class="font-body font-semibold text-center mb-3">
				sau
				<NuxtLink to="/sign-up" class="text-san-marino-600"
					>autentifica-te intr-un cont existent</NuxtLink
				>
			</h3>
		</div>

		<div id="signUpForm">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-1/2 rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form @submit.prevent="signUp()" class="space-y-3">
								<div class="flex flex-row rounded-md gap-2">
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
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-1/2">
										<label
											for="userPassword"
											class="sr-only"
										>
											Parola
										</label>
										<input
											id="userPassword"
											v-model="userPassword"
											name="userPassword"
											type="password"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Parola"
										/>
									</div>

									<div class="w-1/2">
										<label
											for="confirmUserPass"
											class="sr-only"
										>
											Confirmare parola
										</label>
										<input
											id="confirmUserPass"
											v-model="confirmUserPass"
											name="confirmUserPass"
											type="password"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Confirmare parola"
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
										Inregistrare cont
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

<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { LockClosedIcon } from "@heroicons/vue/20/solid";
import { createClient } from "@supabase/supabase-js";

const emailAddress = ref("");
const userPassword = ref("");
const confirmUserPass = ref("");

const { auth } = useSupabaseAuthClient();
const supabase = useSupabaseClient();
const user = useSupabaseUser();

const signUp = async () => {
	let { data, error } = await auth.signUp({
		email: emailAddress.value,
		password: userPassword.value,
	});

	if (data) {
		const { dbData, dbError } = await supabase.from("profiles").insert([
			{
				id: data.user.id,
				role: "USER",
			},
		]);

		if (dbData) console.log(dbData);
		if (dbError) console.error(dbError);
	}

	if (data) console.log(data);
	if (error) console.error(error);
};

watchEffect(() => {
	if (user.value) {
		return navigateTo("/dashboard");
	}
});
</script>
