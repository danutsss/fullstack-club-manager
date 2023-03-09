export const getEuroregion = async (userId: string) => {
	const supabase = useSupabaseClient();
	const { data: euroregion, error } = await supabase
		.from("profiles")
		.select("euroRegionMod")
		.eq("id", userId);

	return euroregion;
};
