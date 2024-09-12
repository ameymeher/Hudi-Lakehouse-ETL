CREATE TABLE IF NOT EXISTS public.sales
(
    salesid SERIAL PRIMARY KEY,
    invoiceid integer,
    itemid integer,
    category text COLLATE pg_catalog."default",
    price numeric(10,2),
    quantity integer,
    orderdate date,
    destinationstate text COLLATE pg_catalog."default",
    shippingtype text COLLATE pg_catalog."default",
    referral text COLLATE pg_catalog."default",
    updated_at TIMESTAMP DEFAULT NOW()
);