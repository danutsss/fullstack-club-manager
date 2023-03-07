import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	clubName: string;
	fullName: string;
	yearOfBirth: number;
	passedExam: string;
	belt: string;
	euroRegion: number;
}

export default defineEventHandler(async (event) => {
	console.log("POST /api/athlete");

	const { clubName, fullName, yearOfBirth, passedExam, belt, euroRegion } =
		await readBody<IRequestBody>(event);

	try {
		if (
			!clubName ||
			!fullName ||
			!yearOfBirth ||
			!passedExam ||
			!belt ||
			!euroRegion
		) {
			console.log(
				"[error occured]: when inserting athlete in our database (missing fields)."
			);

			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage = "Missing fields.")
			);
		}

		const newAthleteData = await prisma.athlete.create({
			data: {
				clubName,
				fullName,
				yearOfBirth,
				passedExam,
				belt,
				euroRegion,
			},
		});

		console.log("athlete was successfully inserted into database.");
		return {
			id: newAthleteData.id,
			name: newAthleteData.fullName,
		};
	} catch (error) {
		console.log(
			`[error occured]: when inserting athlete in our database (${error}).`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Something went wrong.")
		);
	}
});
