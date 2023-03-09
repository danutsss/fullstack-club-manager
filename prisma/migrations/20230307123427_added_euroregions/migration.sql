-- CreateTable
CREATE TABLE "euroRegions" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL DEFAULT '',

    CONSTRAINT "euroRegions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "euroRegions_id_key" ON "euroRegions"("id");
