/*
  Warnings:

  - Added the required column `contrasena` to the `Cliente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Cliente" ADD COLUMN     "contrasena" TEXT NOT NULL;
