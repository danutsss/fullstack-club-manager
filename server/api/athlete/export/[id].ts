import { Athlete, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
    try {
        const athleteIds = event.context.params!.id;
        for (const athleteId of athleteIds) {
            const athlete: Athlete | null = await prisma.athlete.findUnique({
                where: {
                    id: Number(athleteId),
                },
            });
            if (!athlete) {
                console.log(
                    `[error occured]: athlete with id: ${athleteId} not found`
                );

                return (
                    (event.node.res.statusCode = 404) &&
                    (event.node.res.statusMessage =
                        "Sportivul nu a fost gasit! (404)")
                );
            }

            console.log(
                `[succes]: while retrieving data for athlete with id: ${athleteId}`
            );

            return athlete;
        }
    } catch (error) {
        console.log(
            `[error occured]: while retrieving data for athlete with id: ${event.context.params?.id}.\n[error]: ${error}]`
        );

        return (
            (event.node.res.statusCode = 500) &&
            (event.node.res.statusMessage = "Eroare server! (500).")
        );
    }
});
