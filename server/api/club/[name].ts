import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const countyName = event.context.params.name as String;
	const fetchClub = await prisma.club
		.findMany({
			where: {
				clubCounty: String(countyName),
			},
		})
		.catch((error) => console.error(error));
	return fetchClub;
});
