-- CreateTable
CREATE TABLE "Athlete" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "fullName" TEXT NOT NULL DEFAULT '',
    "yearOfBirth" INTEGER NOT NULL DEFAULT 0,
    "passedExam" VARCHAR(18) NOT NULL DEFAULT '',
    "belt" VARCHAR(18) NOT NULL DEFAULT '',

    CONSTRAINT "Athlete_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Athlete_id_key" ON "Athlete"("id");
