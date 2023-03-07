export const getRole = async (userId: string) => {
	const supabase = useSupabaseClient();
	const { data: role, error } = await supabase
		.from("profiles")
		.select("role")
		.eq("id", userId);

	return role;
};
