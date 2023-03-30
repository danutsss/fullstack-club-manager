import { Veteran, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const veteranID = event.context.params?.id as String;
	console.log(`GET /api/veteran/${veteranID}`);

	try {
		console.log(`[fetching veteran]: ${veteranID}`);

		const fetchVeteran: Veteran | null = await prisma.veteran.findUnique({
			where: {
				id: Number(veteranID),
			},
		});

		if (!fetchVeteran) {
			console.log(`[veteran not found]: ${veteranID}`);
			return (
				(event.node.res.statusCode = 404) &&
				(event.node.res.statusMessage = "Veteran not found.")
			);
		}

		console.log(`[veteran found]: ${veteranID}`);
		return fetchVeteran;
	} catch (error) {
		console.error(
			`[error occured]: while fetching veteran with id: ${veteranID}`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
