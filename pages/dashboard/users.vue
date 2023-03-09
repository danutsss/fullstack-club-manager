<template>
	<DashboardNavBar />

	<div>
		<ul>
			<li v-for="user in users">
				{{ user.email }} - {{ user.role }} (moderator: Euroregiunea
				{{ user.euroRegionMod }}) -
				{{ formatDate(user.registrationDate) }}
			</li>
		</ul>
	</div>
</template>

<script setup>
const supabase = useSupabaseClient();

const { data: users } = await supabase
	.from("profiles")
	.select("id, role, euroRegionMod, email, registrationDate");

const formatDate = (date) => {
	return new Date(date).toLocaleDateString("ro-RO", {
		year: "numeric",
		month: "long",
		day: "numeric",
	});
};
</script>
