import { Athlete, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	clubName: string;
	fullName: string;
	dateOfBirth: string;
	passedExam: string;
	belt: string;
	euroRegion: number;
}

export default defineEventHandler(async (event) => {
	const athleteID = event.context.params?.id;

	console.log(`UPDATE /api/athlete/edit/${athleteID}`);

	const { clubName, fullName, dateOfBirth, passedExam, belt, euroRegion } =
		await readBody<IRequestBody>(event);

	try {
		if (
			!clubName ||
			!fullName ||
			!dateOfBirth ||
			!passedExam ||
			!belt ||
			!euroRegion
		) {
			console.log(
				"[error occured]: when updating athlete in our database (Toate campurile sunt obligatorii!)."
			);

			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage =
					"Toate campurile sunt obligatorii!.")
			);
		}

		const athlete: Athlete = await prisma.athlete.update({
			where: {
				id: Number(athleteID),
			},
			data: {
				clubName,
				fullName,
				dateOfBirth,
				passedExam,
				belt,
				euroRegion,
			},
		});

		console.log(`[athlete updated]: ${JSON.stringify(athlete)}`);

		console.log("athlete was successfully updated into database.");

		return {
			id: athlete.id,
			name: athlete.fullName,
		};
	} catch (error) {
		console.error(
			`[error occured]: while updating athlete with id ${athleteID} [${error}].`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
