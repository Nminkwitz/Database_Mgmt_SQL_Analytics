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