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
		const athlete: Athlete = await prisma.athlete.update({
			where: {
				id: Number(athleteID),
			},
			data: {
				clubName: clubName,
				fullName: fullName,
				dateOfBirth: dateOfBirth,
				passedExam: passedExam,
				belt: belt,
				euroRegion: euroRegion,
			},
		});

		console.log(`[athlete updated]: ${JSON.stringify(athlete)}`);

		console.log("athlete was successfully updated into database.");

		return {
			id: athlete.id,
			name: athlete.fullName,
			message: `Atletul ${athlete.fullName} [ID: ${athlete.id}] a fost actualizat cu succes.`,
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
