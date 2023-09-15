import { Athlete, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	clubName: string;
	fullName: string;
	dateOfBirth: string;
	passedExam: string;
	belt: string;
	euroRegion: number;
	examinationType: string;
	coachName: string;
	athleteCNP: string;
	weightCat: string;
	athleteGender: string;
}

export default defineEventHandler(async (event) => {
	console.log("POST /api/athlete");

	const {
		clubName,
		fullName,
		dateOfBirth,
		passedExam,
		belt,
		euroRegion,
		examinationType,
		coachName,
		athleteCNP,
		weightCat,
		athleteGender,
	} = await readBody<IRequestBody>(event);

	try {
		if (
			!clubName ||
			!fullName ||
			!dateOfBirth ||
			!passedExam ||
			!belt ||
			!euroRegion ||
			!examinationType ||
			!coachName ||
			!athleteCNP ||
			!weightCat ||
			!athleteGender
		) {
			console.log(
				"[error occured]: when inserting athlete in our database (Toate campurile sunt obligatorii!)."
			);

			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage =
					"Toate campurile sunt obligatorii!")
			);
		}

		const newAthleteData: Athlete = await prisma.athlete.create({
			data: {
				clubName,
				fullName,
				dateOfBirth,
				passedExam,
				belt,
				euroRegion,
				examinationType,
				coachName,
				athleteCNP,
				weightCat,
				athleteGender,
			},
		});

		console.log("athlete was successfully inserted into database.");
		return {
			id: newAthleteData.id,
			name: newAthleteData.fullName,
			message: `Atletul ${newAthleteData.fullName} a fost inserat cu succes in baza de date.`,
		};
	} catch (error) {
		console.log(
			`[error occured]: when inserting athlete in our database (${error}).`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
