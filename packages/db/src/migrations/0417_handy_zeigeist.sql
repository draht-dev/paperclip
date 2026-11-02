-- Better Auth 1.7.3+ no longer writes account.issuer (added as NOT NULL by
-- 0230 for Better Auth 1.7.0-1.7.2). Relax the constraint and drop the
-- (issuer, account_id) unique index, per the Better Auth 1.7 upgrade guide.
-- Reversible; existing issuer values are kept.
DROP INDEX IF EXISTS "account_issuer_account_id_uq";--> statement-breakpoint
ALTER TABLE "account" ALTER COLUMN "issuer" DROP NOT NULL;
