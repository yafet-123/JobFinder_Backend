/*
  Warnings:

  - The primary key for the `JobCategory` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "JobCategory" DROP CONSTRAINT "JobCategory_pkey",
ADD COLUMN     "job_category_id" SERIAL NOT NULL,
ADD CONSTRAINT "JobCategory_pkey" PRIMARY KEY ("job_category_id");
