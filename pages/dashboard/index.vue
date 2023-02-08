<script setup>
import { createClient } from "@supabase/supabase-js";

// const { data: profile } = await supabase.from("profiles").select("role");
// console.log(profile);

const loggedUser = useSupabaseUser();

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

	<div class="">{{ loggedUser }}</div>
</template>
