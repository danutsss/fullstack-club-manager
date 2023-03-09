<script setup>
const route = useRoute();
const { data: club } = await useFetch(
	() => `/api/club/view/${route.params.id}`
);
</script>

<template>
	<DashboardNavBar />
	{{ club }}
</template>
