import { Athlete, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	try {
		const athleteIds = event.context.params?.id ?? [];
		for (const athleteId of athleteIds) {
			const athlete: Athlete | null = await prisma.athlete.findUnique({
				where: {
					id: Number(athleteId),
				},
			});

			if (!athlete) {
				console.log(
					`[error occured]: athlete with id: ${athleteId} not found`
				);

				return (
					(event.node.res.statusCode = 404) &&
					(event.node.res.statusMessage = "Athlete not found.")
				);
			}

			console.log(
				`[succes]: while retrieving data for athlete with id: ${athleteId}`
			);

			return (
				(event.node.res.statusCode = 200) &&
				(event.node.res.statusMessage = "OK") &&
				athlete
			);
		}
	} catch (error) {
		console.log(
			`[error occured]: while retrieving data for athlete with id: ${event.context.params?.id}.\n[error]: ${error}]`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Internal server error.")
		);
	}
});
