<script setup>
const loggedUser = useSupabaseUser();
const supabase = useSupabaseClient();

const { data: profile } = await supabase.from("profiles").select("role");

watchEffect(() => {
	if (!loggedUser.value) {
		return navigateTo("/sign-in");
	}
});

definePageMeta({
	middleware: "auth",
});
</script>

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
							{{ loggedUser.email }}</span
						>
						<span
							class="border-san-marino-500 border-2 text-san-marino-500 font-bold p-3 rounded w-auto text-center"
							>{{ profile[0].role }}</span
						>
					</div>
				</div>
			</div>
			<div class="col-span-2">
				<div id="profile__information">
					<div class="bg-white p-20 shadow-lg rounded-3xl"></div>
				</div>
			</div>
		</div>
	</section>
</template>
