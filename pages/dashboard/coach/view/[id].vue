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

useHead({
	title: `Modificare antrenor: ${coach.value.fullName} [ID: ${coach.value.id}] @ AJJ.RO`,
	meta: [
		{
			name: "description",
			content: `Modificare informatii pentru antrenorul ${coach.value.fullName} [ID: ${coach.value.id}].`,
		},
		{
			name: "keywords",
			content:
				"panou de control, administratori, utilizatori, moderatori, antrenori, veterani, asociații, AJJ.RO, AJJ, judoka",
		},
		{
			name: "author",
			content: "Matei Nicolae - Daniel @ AJJ.RO",
		},
		{
			name: "robots",
			content: "index, follow",
		},
		{
			name: "googlebot",
			content: "index, follow",
		},
		{
			name: "google",
			content: "nositelinkssearchbox",
		},
		{
			name: "google",
			content: "notranslate",
		},
	],
});
</script>

<template>
	<DashboardNavBar />
	{{ coach }}
</template>
