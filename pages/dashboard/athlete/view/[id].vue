<script setup>
const route = useRoute();
const { data: athlete } = await useFetch(
	() => `/api/athlete/view/${route.params.id}`
);
</script>

<template>
	<DashboardNavBar />
	{{ athlete }}
</template>
