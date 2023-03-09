/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `Club` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Coach` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Law322` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Veteran` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Club_id_key" ON "Club"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Coach_id_key" ON "Coach"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Law322_id_key" ON "Law322"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Veteran_id_key" ON "Veteran"("id");
