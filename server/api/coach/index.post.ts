import { Coach, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	fullName: string;
	phoneNo: string;
	emailAddress: string;
	coachNationality: string;
	coachClub: string;
	dateOfBirth: string;
	placeOfWork: string;
	domainOfWork: string;
	workResponsabilities: string;
	workPeriod: string;
	occupiedFunction: string;
	coachQualification: string;
	obtainedDegree: string;
	otherSkills: string;
	blackBelt: string;
	coachPublications: string;
	coachProfessionalActivity: string;
	coachResults: string;
	coachExtraInfo: string;
}

export default defineEventHandler(async (event) => {
	console.log("POST /api/coach");

	const {
		fullName,
		phoneNo,
		emailAddress,
		coachNationality,
		coachClub,
		dateOfBirth,
		placeOfWork,
		domainOfWork,
		workResponsabilities,
		workPeriod,
		occupiedFunction,
		coachQualification,
		obtainedDegree,
		otherSkills,
		blackBelt,
		coachPublications,
		coachProfessionalActivity,
		coachResults,
		coachExtraInfo,
	} = await readBody<IRequestBody>(event);

	try {
		console.log("insert coach into database.");

		if (
			!fullName ||
			!phoneNo ||
			!emailAddress ||
			!coachNationality ||
			!dateOfBirth ||
			!placeOfWork ||
			!domainOfWork ||
			!workPeriod ||
			!occupiedFunction ||
			!coachQualification ||
			!obtainedDegree ||
			!blackBelt ||
			!coachClub
		) {
			console.log(
				"[error occured]: when inserting coach into database (missing fields)."
			);
			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage = "Missing fields.")
			);
		}

		const newCoachData: Coach | null = await prisma.coach.create({
			data: {
				fullName,
				phoneNo,
				emailAddress,
				coachNationality,
				coachClub,
				dateOfBirth,
				placeOfWork,
				domainOfWork,
				workResponsabilities,
				workPeriod,
				occupiedFunction,
				coachQualification,
				obtainedDegree,
				otherSkills,
				blackBelt,
				coachPublications,
				coachProfessionalActivity,
				coachResults,
				coachExtraInfo,
			},
		});

		console.log("coach was successfully inserted into our database.");
		return {
			id: newCoachData.id,
			name: newCoachData.fullName,
		};
	} catch (error) {
		console.log(
			`[error occured]: when inserting club into database. (${error})`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Something went wrong")
		);
	}
});
