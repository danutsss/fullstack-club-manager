import { PrismaClient } from "@prisma/client";
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
	console.log("POST /api/clubs");

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
		console.log("insert club into database.");
		const newClubData = await prisma.club.create({
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
				clubVerified,
			},
		});

		return {
			id: newClubData.id,
			name: newClubData.clubName,
		};
	} catch (error) {
		console.dir(error);
        event.node.res.statusCode = 500;
        return {
            code: "ERROR",
            messages: "Something went wrong."
        }
	}
});
