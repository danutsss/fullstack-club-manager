-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'MODERATOR', 'ADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) DEFAULT '',
    "emailAddress" VARCHAR(255) NOT NULL DEFAULT 'email@example.com',
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'USER',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Veteran" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR(64) NOT NULL DEFAULT '',
    "lastName" VARCHAR(64) NOT NULL DEFAULT '',
    "emailAddress" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "dateOfBirth" VARCHAR(64) NOT NULL DEFAULT '',
    "homeAddress" TEXT NOT NULL DEFAULT '',
    "weightCat" VARCHAR(64) NOT NULL DEFAULT '',
    "ageCat" VARCHAR(64) NOT NULL DEFAULT '',
    "gradation" VARCHAR(128) NOT NULL DEFAULT '',
    "phoneNo" VARCHAR(32) NOT NULL DEFAULT '',

    CONSTRAINT "Veteran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Law322" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "fullName" VARCHAR(64) NOT NULL DEFAULT '',
    "emailAddress" TEXT NOT NULL DEFAULT 'email@example.com',
    "phoneNo" TEXT NOT NULL DEFAULT '',
    "noRegisteredAthletes" INTEGER NOT NULL,
    "noParticipatingAthletes" INTEGER NOT NULL,
    "noRegisteredJuniors" INTEGER NOT NULL,
    "noParticipatingJuniors" INTEGER NOT NULL,

    CONSTRAINT "Law322_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Club" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "clubCounty" VARCHAR(64) NOT NULL DEFAULT '',
    "clubAddress" TEXT NOT NULL DEFAULT '',
    "clubContactPerson" TEXT NOT NULL DEFAULT '',
    "clubEmail" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "clubAfiliatFRJ" TEXT NOT NULL DEFAULT '',
    "clubAfiliatAJJ" TEXT NOT NULL DEFAULT '',
    "clubCoachOneName" TEXT NOT NULL DEFAULT '',
    "clubCoachTwoName" TEXT NOT NULL DEFAULT '',
    "clubCoachThreeName" TEXT NOT NULL DEFAULT '',
    "clubWebAddress" TEXT NOT NULL DEFAULT '',
    "clubFbAddress" TEXT NOT NULL DEFAULT '',
    "clubSocialAccounts" TEXT NOT NULL DEFAULT '',
    "dojoOneAddress" TEXT NOT NULL DEFAULT '',
    "dojoOneContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoOneEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoOneTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoOneAgeGroups" TEXT NOT NULL DEFAULT '',
    "dojoTwoAddress" TEXT NOT NULL DEFAULT '',
    "dojoTwoContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoTwoEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoTwoTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoTwoAgeGroups" TEXT NOT NULL DEFAULT '',
    "dojoThreeAddress" TEXT NOT NULL DEFAULT '',
    "dojoThreeContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoThreeEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoThreeTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoThreeAgeGroups" TEXT NOT NULL DEFAULT '',
    "clubExtraInfo" TEXT NOT NULL DEFAULT '',
    "clubVerified" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coach" (
    "id" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL DEFAULT '',
    "phoneNo" TEXT NOT NULL DEFAULT '',
    "emailAddress" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "coachNationality" VARCHAR(64) NOT NULL DEFAULT '',
    "dateOfBirth" VARCHAR(64) NOT NULL DEFAULT '',
    "placeOfWork" TEXT NOT NULL DEFAULT '',
    "domainOfWork" TEXT NOT NULL DEFAULT '',
    "workResponsabilities" TEXT NOT NULL DEFAULT '',
    "workPeriod" TEXT NOT NULL DEFAULT '',
    "occupiedFunction" VARCHAR(256) NOT NULL DEFAULT '',
    "coachQualification" VARCHAR(256) NOT NULL DEFAULT '',
    "obtainedDegree" VARCHAR(256) NOT NULL DEFAULT '',
    "otherSkills" TEXT NOT NULL DEFAULT '',
    "blackBelt" VARCHAR(10) NOT NULL DEFAULT '',
    "coachPublications" TEXT NOT NULL DEFAULT '',
    "coachProfessionalActivity" TEXT NOT NULL DEFAULT '',
    "coachResults" TEXT NOT NULL DEFAULT '',
    "coachExtraInfo" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Coach_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_emailAddress_key" ON "User"("emailAddress");

