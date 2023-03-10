export const getCategory = async (userId: string) => {
	const supabase = useSupabaseClient();

	const { data: category, error } = await supabase
		.from("profiles")
		.select("categoryMod")
		.eq("id", userId);

	return category;
};
