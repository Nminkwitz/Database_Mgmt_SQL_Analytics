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