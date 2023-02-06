import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	firstName: string;
	lastName: string;
	emailAddress: string;
	dateOfBirth: string;
	homeAddress: string;
	weightCat: string;
	ageCat: string;
	gradation: string;
	phoneNo: string;
}

export default defineEventHandler(async (event) => {
	console.log("POST /api/veteran");
	const {
		firstName,
		lastName,
		emailAddress,
		dateOfBirth,
		homeAddress,
		weightCat,
		ageCat,
		gradation,
		phoneNo,
	} = await readBody<IRequestBody>(event);

	try {
		if (
			!firstName ||
			!lastName ||
			!emailAddress ||
			!dateOfBirth ||
			!homeAddress ||
			!weightCat ||
			!ageCat ||
			!gradation ||
			!phoneNo
		) {
			console.log(
				"[error occured]: while inserting veteran into database. (missing fields)"
			);

			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage = "Missing fields")
			);
		}

		const newVetData = await prisma.veteran.create({
			data: {
				firstName,
				lastName,
				emailAddress,
				dateOfBirth,
				homeAddress,
				weightCat,
				ageCat,
				gradation,
				phoneNo,
			},
		});

		console.log("veteran has been inserted successfully into database.");

		return {
			id: newVetData.id,
			name: `${newVetData.firstName} ${newVetData.lastName}`,
		};
	} catch (error) {
		console.log(
			`[error occured]: while inserting into database. (${error})`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Something went wrong.")
		);
	}
});
