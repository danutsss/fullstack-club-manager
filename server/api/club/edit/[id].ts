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
		if (
			!clubName ||
			!clubAddress ||
			!clubContactPerson ||
			!clubEmail ||
			!clubAfiliatAJJ ||
			!clubAfiliatFRJ ||
			!clubCoachOneName ||
			!clubCounty
		) {
			console.log(
				`[error occured]: when inserting club into database (Toate campurile sunt obligatorii!).`
			);
			return (
				(event.node.res.statusCode = 400) &&
				(event.node.res.statusMessage =
					"Toate campurile sunt obligatorii!.")
			);
		}

		const club: Club = await prisma.club.update({
			where: {
				id: Number(clubID),
			},
			data: {
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
			},
		});

		console.log(`[club updated]: ${JSON.stringify(club)}`);

		console.log("club was successfully updated into database.");

		return {
			id: club.id,
			name: club.clubName,
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
