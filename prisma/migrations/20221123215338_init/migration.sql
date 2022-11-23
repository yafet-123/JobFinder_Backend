/*
  Warnings:

  - The primary key for the `Category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `category_id` column on the `Category` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `user_id` column on the `Category` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Job` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `job_id` column on the `Job` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `user_id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `user_id` on the `Job` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_CategoryToJob` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_CategoryToJob` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Category" DROP CONSTRAINT "Category_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Job" DROP CONSTRAINT "Job_user_id_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToJob" DROP CONSTRAINT "_CategoryToJob_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToJob" DROP CONSTRAINT "_CategoryToJob_B_fkey";

-- AlterTable
ALTER TABLE "Category" DROP CONSTRAINT "Category_pkey",
DROP COLUMN "category_id",
ADD COLUMN     "category_id" SERIAL NOT NULL,
DROP COLUMN "user_id",
ADD COLUMN     "user_id" INTEGER,
ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("category_id");

-- AlterTable
ALTER TABLE "Job" DROP CONSTRAINT "Job_pkey",
DROP COLUMN "job_id",
ADD COLUMN     "job_id" SERIAL NOT NULL,
DROP COLUMN "user_id",
ADD COLUMN     "user_id" INTEGER NOT NULL,
ADD CONSTRAINT "Job_pkey" PRIMARY KEY ("job_id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "user_id",
ADD COLUMN     "user_id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("user_id");

-- AlterTable
ALTER TABLE "_CategoryToJob" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToJob_AB_unique" ON "_CategoryToJob"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToJob_B_index" ON "_CategoryToJob"("B");

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "_CategoryToJob" ADD CONSTRAINT "_CategoryToJob_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("category_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToJob" ADD CONSTRAINT "_CategoryToJob_B_fkey" FOREIGN KEY ("B") REFERENCES "Job"("job_id") ON DELETE CASCADE ON UPDATE CASCADE;
