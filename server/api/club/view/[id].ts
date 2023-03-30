import { Club, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const clubID = event.context.params?.id as String;
	console.log(`GET /api/club/${clubID}`);

	try {
		console.log(`[fetching club]: ${clubID}`);

		const fetchClub: Club | null = await prisma.club.findUnique({
			where: {
				id: Number(clubID),
			},
		});

		if (!fetchClub) {
			console.log(`[club not found]: ${clubID}`);
			return (
				(event.node.res.statusCode = 404) &&
				(event.node.res.statusMessage = "Club not found.")
			);
		}

		console.log(`[club found]: ${clubID}`);
		return fetchClub;
	} catch (error) {
		console.error(
			`[error occured]: while fetching club with id: ${clubID}`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
