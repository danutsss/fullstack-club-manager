import { Club, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface IRequestBody {
	clubName: string;
	clubCounty: string;
	clubAddress: string;
	clubContactPerson: string;
	clubEmail: string;
	clubAfiliatFRJ: string;
	clubAfiliatAJJ: string;
	clubCoachOneName: string;
	clubCoachTwoName: string;
	clubCoachThreeName: string;
	clubWebAddress: string;
	clubFbAddress: string;
	clubSocialAccounts: string;
	dojoOneAddress: string;
	dojoOneContactPerson: string;
	dojoOneEmailAddress: string;
	dojoOneTatamiMP: string;
	dojoOneAgeGroups: string;
	dojoTwoAddress: string;
	dojoTwoContactPerson: string;
	dojoTwoEmailAddress: string;
	dojoTwoTatamiMP: string;
	dojoTwoAgeGroups: string;
	dojoThreeAddress: string;
	dojoThreeContactPerson: string;
	dojoThreeEmailAddress: string;
	dojoThreeTatamiMP: string;
	dojoThreeAgeGroups: string;
	clubExtraInfo: string;
	clubVerified: boolean;
}

export default defineEventHandler(async (event) => {
	const clubID = event.context.params?.id;

	console.log(`UPDATE /api/club/edit/${clubID}`);

	const {
		clubName,
		clubCounty,
		clubAddress,
		clubContactPerson,
		clubEmail,
		clubAfiliatFRJ,
		clubAfiliatAJJ,
		clubCoachOneName,
		clubCoachTwoName,
		clubCoachThreeName,
		clubWebAddress,
		clubFbAddress,
		clubSocialAccounts,
		dojoOneAddress,
		dojoOneContactPerson,
		dojoOneEmailAddress,
		dojoOneTatamiMP,
		dojoOneAgeGroups,
		dojoTwoAddress,
		dojoTwoContactPerson,
		dojoTwoEmailAddress,
		dojoTwoTatamiMP,
		dojoTwoAgeGroups,
		dojoThreeAddress,
		dojoThreeContactPerson,
		dojoThreeEmailAddress,
		dojoThreeTatamiMP,
		dojoThreeAgeGroups,
		clubExtraInfo,
		clubVerified,
	} = await readBody<IRequestBody>(event);
	try {
		const club: Club = await prisma.club.update({
			where: {
				id: Number(clubID),
			},
			data: {
				clubName: clubName,
				clubCounty: clubCounty,
				clubAddress: clubAddress,
				clubContactPerson: clubContactPerson,
				clubEmail: clubEmail,
				clubAfiliatFRJ: clubAfiliatFRJ,
				clubAfiliatAJJ: clubAfiliatAJJ,
				clubCoachOneName: clubCoachOneName,
				clubCoachTwoName: clubCoachTwoName,
				clubCoachThreeName: clubCoachThreeName,
				clubWebAddress: clubWebAddress,
				clubFbAddress: clubFbAddress,
				clubSocialAccounts: clubSocialAccounts,
				dojoOneAddress: dojoOneAddress,
				dojoOneContactPerson: dojoOneContactPerson,
				dojoOneEmailAddress: dojoOneEmailAddress,
				dojoOneTatamiMP: dojoOneTatamiMP,
				dojoOneAgeGroups: dojoOneAgeGroups,
				dojoTwoAddress: dojoTwoAddress,
				dojoTwoContactPerson: dojoTwoContactPerson,
				dojoTwoEmailAddress: dojoTwoEmailAddress,
				dojoTwoTatamiMP: dojoTwoTatamiMP,
				dojoTwoAgeGroups: dojoTwoAgeGroups,
				dojoThreeAddress: dojoThreeAddress,
				dojoThreeContactPerson: dojoThreeContactPerson,
				dojoThreeEmailAddress: dojoThreeEmailAddress,
				dojoThreeTatamiMP: dojoThreeTatamiMP,
				dojoThreeAgeGroups: dojoThreeAgeGroups,
				clubExtraInfo: clubExtraInfo,
			},
		});

		console.log(`[club updated]: ${JSON.stringify(club)}`);

		console.log("club was successfully updated into database.");

		return {
			id: club.id,
			name: club.clubName,
			message: `Clubul ${club.clubName} [ID: ${club.id}] a fost actualizat cu succes!`,
		};
	} catch (error) {
		console.error(
			`[error occured]: while updating club with id ${clubID} [${error}].`
		);

		return (
			(event.node.res.statusCode = 500) &&
			(event.node.res.statusMessage = "Eroare server! (500).")
		);
	}
});
