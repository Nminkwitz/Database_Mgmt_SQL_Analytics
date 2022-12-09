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
