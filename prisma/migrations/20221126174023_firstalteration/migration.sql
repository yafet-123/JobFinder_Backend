/*
  Warnings:

  - You are about to drop the `_CategoryToJob` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_CategoryToJob" DROP CONSTRAINT "_CategoryToJob_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToJob" DROP CONSTRAINT "_CategoryToJob_B_fkey";

-- DropTable
DROP TABLE "_CategoryToJob";

-- CreateTable
CREATE TABLE "JobCategory" (
    "user_id" INTEGER,
    "category_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,
    "CreatedDate" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JobCategory_pkey" PRIMARY KEY ("category_id","job_id")
);

-- AddForeignKey
ALTER TABLE "JobCategory" ADD CONSTRAINT "JobCategory_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("category_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "JobCategory" ADD CONSTRAINT "JobCategory_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("job_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "JobCategory" ADD CONSTRAINT "JobCategory_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL ON UPDATE NO ACTION;
