-- Table: public.accounts 

-- DROP TABLE IF EXISTS public.accounts; 

CREATE TABLE IF NOT EXISTS public.accounts 
( 
    account_id int NOT NULL, 
    account_name character varying (60) COLLATE pg_catalog."default", 
    account_contact character varying (60) COLLATE pg_catalog."default", 
    account_email character varying (60) COLLATE pg_catalog."default", 
    phone_number character varying (60) COLLATE pg_catalog."default", 
    address character varying (60) COLLATE pg_catalog."default", 
    city character varying (60) COLLATE pg_catalog."default", 
	state character varying (60) COLLATE pg_catalog."default", 
	timezone character varying (60) COLLATE pg_catalog."default", 
	account_manager int NOT NULL 
)

TABLESPACE pg_default; 

ALTER TABLE IF EXISTS public.accounts 
    OWNER to postgres; 