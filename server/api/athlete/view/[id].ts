import { Athlete, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const athleteID = event.context.params?.id as String;
	console.log(`GET /api/athlete/${athleteID}`);

	try {
		console.log(`[fetching athlete]: ${athleteID}`);

		const fetchathlete: Athlete | null = await prisma.athlete.findUnique({
			where: {
				id: Number(athleteID),
			},
		});

		if (!fetchathlete) {
			console.log(`[athlete not found]: ${athleteID}`);
			return (
				(event.node.res.statusCode = 404) &&
				(event.node.res.statusMessage =
					"Atletul nu a fost gasit! (404)")
			);
		}

		console.log(`[athlete found]: ${athleteID}`);
		return fetchathlete;
	} catch (error) {
		console.error(
			`[error occured]: while fetching athlete with id: ${athleteID}`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
