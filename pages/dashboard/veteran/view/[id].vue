<script setup>
const route = useRoute();
const { data: veteran } = await useFetch(
	() => `/api/veteran/view/${route.params.id}`
);
</script>

<template>
	<DashboardNavBar />
	{{ veteran }}
</template>
