import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const id = event.context.params?.id as String;
	console.log(`DELETE /api/athlete/delete/${id}`);

	try {
		console.log("delete athlete from database.");

		const deleteAthlete = await prisma.athlete
			.delete({
				where: {
					id: Number(id),
				},
			})
			.catch((error) => console.error(error));

		console.log(`athlete was susccessfullly deleted from database.`);

		return deleteAthlete;
	} catch (error) {
		console.log(
			`[error occured]: when deleting athlete from database. (${error}).`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Something went wrong.")
		);
	}
});
