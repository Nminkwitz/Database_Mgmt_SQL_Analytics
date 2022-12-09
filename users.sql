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