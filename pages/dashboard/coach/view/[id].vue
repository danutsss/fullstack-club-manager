<script setup>
const route = useRoute();
const { data: coach } = await useFetch(
	() => `/api/coach/view/${route.params.id}`
);
</script>

<template>
	<DashboardNavBar />
	{{ coach }}
</template>
