CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50)
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50),
    "stateId" INTEGER REFERENCES states(id)
);

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" VARCHAR(150),
    "cpf" TEXT UNIQUE NOT NULL,
    "email" TEXT UNIQUE,
    "password" TEXT UNIQUE NOT NULL
);

CREATE TABLE "customerAdresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER REFERENCES cities(id) 
);

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "number" BIGINT,
    "type" TEXT
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "accountNumber" BIGINT,
    "agency" INTEGER,
    "openDate" DATE,
    "closeDate" DATE
);

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER REFERENCES "bankAccount"(id),
    "amount" BIGINT NOT NULL,
    "type" TEXT,
    "time" TIME,
    "description" TEXT,
    "cancelled" BOOLEAN    
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER REFERENCES "bankAccount"(id),
    "name" VARCHAR(50),
    "number" BIGINT UNIQUE NOT NULL,
    "securiyCode" INTEGER UNIQUE NOT NULL,
    "expirationMonth" VARCHAR(10),
    "expirationYear" VARCHAR(10),
    "password" TEXT NOT NULL,
    "limit" INTEGER
);
