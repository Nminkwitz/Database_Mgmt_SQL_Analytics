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

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    user_id int NOT NULL,
    full_name character varying (60) COLLATE pg_catalog."default",
    first_name character varying (60) COLLATE pg_catalog."default",
    last_name character varying (60) COLLATE pg_catalog."default",
    birth_date date,
    salary numeric(10,2),
    sex character varying (60) COLLATE pg_catalog."default",
	hire_date date,
	email character varying (60) COLLATE pg_catalog."default",
	phone_number character varying (60) COLLATE pg_catalog."default",
	dept_id int NOT NULL,
	office_id int NOT NULL,
	role_id int NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;
	
-- Table: public.projects

-- DROP TABLE IF EXISTS public.projects;

CREATE TABLE IF NOT EXISTS public.projects
(
    project_id int NOT NULL,
    account_id int NOT NULL,
    project_name character varying(60) COLLATE pg_catalog."default",
    project_desc text,
    user_id int NOT NULL,
    deadline date,
    bill_rate numeric(10,2),
	dept_id int NOT NULL,
	office_id int NOT NULL,
    billed_date date,
    paid_date date,
	due_date date,
	hours_billed int,
	billed_amount numeric(10,2),
	paid_amount numeric(10,2)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.projects
    OWNER to postgres;
	
-- Table: public.roles 

-- DROP TABLE IF EXISTS public."roles"; 

CREATE TABLE IF NOT EXISTS public.roles 
(
    role_id integer, 
    role_name character varying(128) COLLATE pg_catalog."default", 
    role_desc TEXT, 
    dept character varying(128) COLLATE pg_catalog."default" 
) 

TABLESPACE pg_default; 

ALTER TABLE IF EXISTS public.roles 

    OWNER to postgres; 

-- Table: public.departments 

-- DROP TABLE IF EXISTS public."departments"; 

CREATE TABLE IF NOT EXISTS public.departments 
( 
    dept_id integer, 
    dept_name character varying(128) COLLATE pg_catalog."default", 
    dept_suffix character varying(128) COLLATE pg_catalog."default", 
	dept_desc TEXT 
) 

TABLESPACE pg_default; 

ALTER TABLE IF EXISTS public.departments 

    OWNER to postgres; 
	
-- Table: public.offices 

-- DROP TABLE IF EXISTS public."offices"; 

CREATE TABLE IF NOT EXISTS public.offices 
(
    office_id integer, 
    office_name character varying(128) COLLATE pg_catalog."default", 
    phone_number character varying(128) COLLATE pg_catalog."default", 
	fax_number character varying(128) COLLATE pg_catalog."default", 
	address character varying(128) COLLATE pg_catalog."default", 
	city character varying(128) COLLATE pg_catalog."default", 
	state character varying(128) COLLATE pg_catalog."default", 
	timezome character varying(128) COLLATE pg_catalog."default" 
) 

TABLESPACE pg_default; 

ALTER TABLE IF EXISTS public.offices 

    OWNER to postgres; 
