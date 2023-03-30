import { Coach, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const coachID = event.context.params?.id as String;
	console.log(`GET /api/coach/${coachID}`);

	try {
		console.log(`[fetching coach]: ${coachID}`);

		const fetchCoach: Coach | null = await prisma.coach.findUnique({
			where: {
				id: Number(coachID),
			},
		});

		if (!fetchCoach) {
			console.log(`[coach not found]: ${coachID}`);
			return (
				(event.node.res.statusCode = 404) &&
				(event.node.res.statusMessage = "Coach not found.")
			);
		}

		console.log(`[coach found]: ${coachID}`);
		return fetchCoach;
	} catch (error) {
		console.error(
			`[error occured]: while fetching coach with id: ${coachID}`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
