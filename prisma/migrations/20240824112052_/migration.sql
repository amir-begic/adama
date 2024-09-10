/*
  Warnings:

  - You are about to drop the column `userAway` on the `Game` table. All the data in the column will be lost.
  - You are about to drop the column `userHome` on the `Game` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Standings` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userAwayId` to the `Game` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userHomeId` to the `Game` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teamId` to the `Standings` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Game" DROP COLUMN "userAway",
DROP COLUMN "userHome",
ADD COLUMN     "confirmedByAway" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "userAwayId" INTEGER NOT NULL,
ADD COLUMN     "userHomeId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Standings" ADD COLUMN     "teamId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Standings_userId_key" ON "Standings"("userId");

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_userHomeId_fkey" FOREIGN KEY ("userHomeId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_userAwayId_fkey" FOREIGN KEY ("userAwayId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Standings" ADD CONSTRAINT "Standings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
