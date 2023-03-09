import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const id = event.context.params?.id as String;
	console.log(`DELETE /api/club/delete/${id}`);

	try {
		console.log("delete club from database.");

		const deleteClub = await prisma.club
			.delete({
				where: {
					id: Number(id),
				},
			})
			.catch((error) => console.error(error));

		console.log(`club was susccessfullly deleted from database.`);

		return deleteClub;
	} catch (error) {
		console.log(
			`[error occured]: when deleting club from database. (${error}).`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Something went wrong.")
		);
	}
});
