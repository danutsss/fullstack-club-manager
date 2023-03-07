/*
  Warnings:

  - You are about to drop the `euroRegions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "euroRegions";

-- CreateTable
CREATE TABLE "Euroregion" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL DEFAULT '',

    CONSTRAINT "Euroregion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Euroregion_id_key" ON "Euroregion"("id");
