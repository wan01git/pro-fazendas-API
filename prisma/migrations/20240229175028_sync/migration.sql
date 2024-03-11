/*
  Warnings:

  - You are about to drop the column `email` on the `contracts` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `contracts` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `contracts` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `contracts` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[id_eduzz]` on the table `contracts` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_eduzz` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `invoices` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `next_charge` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_frequency` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_last_date` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_method` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_repeat_type` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_name` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subscription_value` to the `contracts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `value` to the `contracts` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `contracts_email_key` ON `contracts`;

-- AlterTable
ALTER TABLE `contracts` DROP COLUMN `email`,
    DROP COLUMN `name`,
    DROP COLUMN `password`,
    DROP COLUMN `phone`,
    ADD COLUMN `cancel_data` DATETIME(3) NULL,
    ADD COLUMN `cancel_reason` DATETIME(3) NULL,
    ADD COLUMN `id_eduzz` VARCHAR(191) NOT NULL,
    ADD COLUMN `invoices` INTEGER NOT NULL,
    ADD COLUMN `next_charge` DATETIME(3) NOT NULL,
    ADD COLUMN `payment_frequency` INTEGER NOT NULL,
    ADD COLUMN `payment_last_date` DATETIME(3) NOT NULL,
    ADD COLUMN `payment_method` VARCHAR(191) NOT NULL,
    ADD COLUMN `payment_repeat_type` VARCHAR(191) NOT NULL,
    ADD COLUMN `product_id` INTEGER NOT NULL,
    ADD COLUMN `product_name` VARCHAR(191) NOT NULL,
    ADD COLUMN `start_date` DATETIME(3) NOT NULL,
    ADD COLUMN `status` VARCHAR(191) NOT NULL,
    ADD COLUMN `subscription_value` DOUBLE NOT NULL,
    ADD COLUMN `update_date` DATETIME(3) NULL,
    ADD COLUMN `user_observations` VARCHAR(191) NULL,
    ADD COLUMN `value` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `users` MODIFY `cpf` VARCHAR(191) NULL,
    MODIFY `id_eduzz` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `contracts_id_eduzz_key` ON `contracts`(`id_eduzz`);
