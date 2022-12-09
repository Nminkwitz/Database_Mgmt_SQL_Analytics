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