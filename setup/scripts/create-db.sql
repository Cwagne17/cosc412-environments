-- ################################## -
-- Team 5 - Create Tables SQL Script  -
-- ################################## -

CREATE TABLE IF NOT EXISTS "work-type" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
    "type" character varying(45) NOT NULL, 
    CONSTRAINT "UQ_8fa95cd60f83bee822ab191f86d" UNIQUE ("type"), 
    CONSTRAINT "PK_35b5c9bb5a800808d4b43c83254" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "contract" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
    "amount" integer NOT NULL, 
    "contract_date" date NOT NULL, 
    "end_date" date NOT NULL, 
    "memo" text NOT NULL, 
    "condition" text NOT NULL, 
    "vendor_id" uuid NOT NULL, 
    CONSTRAINT "PK_17c3a89f58a2997276084e706e8" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "payment-info" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
    "amount" integer NOT NULL, 
    "check_number" integer NOT NULL, 
    "current_date" date NOT NULL, 
    "memo" text NOT NULL, 
    "contract_id" uuid NOT NULL, 
    CONSTRAINT "PK_c6c1e81b6fc6176faf843832a78" PRIMARY KEY ("id")
);


CREATE TYPE "public"."vendor_status_enum" AS ENUM(
    'in contract', 
    'active', 
    'inactive', 
    'has issues'
);

CREATE IF NOT EXISTS TABLE "vendor" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
    "vendor_name" character varying(45) NOT NULL, 
    "first_name" character varying(45) NOT NULL, 
    "last_name" character varying(45) NOT NULL, 
    "selection_method" text NOT NULL, 
    "status" "public"."vendor_status_enum", 
    "contact_phone_number" character varying(14) NOT NULL, 
    "contact_email" text NOT NULL, 
    "memo" text NOT NULL, 
    "worktype" uuid NOT NULL,
    CONSTRAINT "UQ_701b24047c58971f09e04b39bf6" UNIQUE ("vendor_name"), 
    CONSTRAINT "PK_931a23f6231a57604f5a0e32780" PRIMARY KEY ("id")
);
