import { Law322, Prisma, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	clubName: string;
	fullName: string;
	emailAddress: string;
	phoneNo: string;
	noRegisteredAthletes: number;
	noParticipatingAthletes: number;
	noRegisteredJuniors: number;
	noParticipatingJuniors: number;
}

export default defineEventHandler(async (event) => {
	console.log("POST /api/law");

	const {
		clubName,
		fullName,
		emailAddress,
		phoneNo,
		noRegisteredAthletes,
		noParticipatingAthletes,
		noRegisteredJuniors,
		noParticipatingJuniors,
	} = await readBody<IRequestBody>(event);

	try {
		console.log("insert `/sign-law` into database.");

		if (
			!clubName ||
			!fullName ||
			!emailAddress ||
			!phoneNo ||
			!noRegisteredAthletes ||
			!noRegisteredJuniors ||
			!noParticipatingAthletes ||
			!noParticipatingJuniors
		) {
			console.log(
				"[error occured]: while saving the `/sign-law`. (Toate campurile sunt obligatorii!)"
			);

			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage =
					"Toate campurile sunt obligatorii!")
			);
		}

		const newLawData: Law322 | null = await prisma.law322.create({
			data: {
				clubName,
				fullName,
				emailAddress,
				phoneNo,
				noRegisteredAthletes,
				noParticipatingAthletes,
				noRegisteredJuniors,
				noParticipatingJuniors,
			},
		});

		console.log("signed law was successfully saved into our database.");
		return {
			id: newLawData.id,
			clubName: newLawData.clubName,
			fullName: newLawData.fullName,
			message: "Legea 322 a fost semnata cu succes.",
		};
	} catch (error) {
		console.log(
			`[error occured]: while saving the signed law into database. (${error})`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500)")
		);
	}
});
