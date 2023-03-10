<script setup>
const route = useRoute();
const { data: coach } = await useFetch(
	() => `/api/coach/view/${route.params.id}`
);

const supabase = useSupabaseClient();

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's category moderator.
const categories = await getCategory(user.id);
const userCategoryMod = categories[0].categoryMod;

// Make inputs read-only if the user is not admin or moderator.
const isReadOnly = () => {
	return userRole !== "ADMIN" && userCategoryMod.indexOf("ANTRENORI") === -1;
};
</script>

<template>
	<DashboardNavBar />
	{{ coach }}
</template>
