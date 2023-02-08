<script setup>
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = "https://nkhpdpsosekugclzsydr.supabase.co";
const supabaseKey =
	"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5raHBkcHNvc2VrdWdjbHpzeWRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU2OTQzNTQsImV4cCI6MTk5MTI3MDM1NH0.Uu5DE59P1tvHmCXtTVca7UrOYQKMDEuEI5HLjHHLPIQ";
const supabase = createClient(supabaseUrl, supabaseKey);

let {
	data: { user },
} = await supabase.auth.getUser();

const { data: profile } = await supabase.from("profiles").select("role");
console.log(profile);
</script>

<template>
	<DashboardNavBar />

	<div class="">{{ user }}</div>
</template>
