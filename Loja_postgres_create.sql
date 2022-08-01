CREATE TABLE "public.users" (
	"id" integer NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"address" TEXT,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.product" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	"preço" serial NOT NULL,
	"foto" TEXT NOT NULL,
	"categoryId" integer NOT NULL UNIQUE,
	"tamanho" TEXT NOT NULL UNIQUE,
	CONSTRAINT "product_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" integer NOT NULL,
	"userId" integer NOT NULL,
	"data" timestamp with time zone NOT NULL DEFAULT 'NOW()',
	"address" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"productId" integer NOT NULL,
	"amount" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photoProduct" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"photo" TEXT NOT NULL,
	"mainPhoto" BOOLEAN NOT NULL,
	CONSTRAINT "photoProduct_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "product" ADD CONSTRAINT "product_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "product"("id");

ALTER TABLE "photoProduct" ADD CONSTRAINT "photoProduct_fk0" FOREIGN KEY ("productId") REFERENCES "product"("id");






