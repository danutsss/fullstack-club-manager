export const formatDate = (date: Date) => {
	return new Date(date).toLocaleDateString("ro-RO", {
		year: "numeric",
		month: "long",
		day: "numeric",
	});
};
