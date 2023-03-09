<template>
	<DashboardNavBar />
	{{ user }}
</template>

<script setup>
const route = useRoute();
const supabase = useSupabaseClient();

const { data: user } = await supabase
	.from("profiles")
	.select("id, role, euroRegionMod, email, registrationDate")
	.match({ id: route.params.id });
</script>
