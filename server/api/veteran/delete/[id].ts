import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
	const id = event.context.params?.id as String;
	console.log(`DELETE /api/veteran/delete/${id}`);

	try {
		console.log("delete veteran from database.");

		const deleteVet = await prisma.veteran
			.delete({
				where: {
					id: Number(id),
				},
			})
			.catch((error) => console.error(error));

		console.log(`veteran was susccessfullly deleted from database.`);

		return deleteVet;
	} catch (error) {
		console.log(
			`[error occured]: when deleting veteran from database. (${error}).`
		);
		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
