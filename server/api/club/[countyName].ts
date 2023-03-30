import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const countyName = event.context.params?.countyName as String;
	const fetchClubs = await prisma.club
		.findMany({
			where: {
				clubCounty: String(countyName),
			},
		})
		.catch((error) => {
			console.error(
				`[error occured]: while fetching clubs from county: ${countyName}. \n[error]: ${error}`
			);
			return (
				(event.node.res.statusCode = 500) &&
				(event.node.res.statusMessage = "Eroare server! (500).")
			);
		});
	return fetchClubs;
});
