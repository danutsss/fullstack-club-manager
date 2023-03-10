import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const athleteId = event.context.params?.id;
	const athlete = await prisma.athlete.findUnique({
		where: { id: Number(athleteId) },
	});

	if (!athlete) {
		throw new Error("Athlete not found");
	}

	return athlete;
});
