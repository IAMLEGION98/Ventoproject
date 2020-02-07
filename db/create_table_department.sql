-- Table: public.department

-- DROP TABLE public.department;

CREATE TABLE public.department
(
    id integer NOT NULL,
    name text NOT NULL,
    location text ,
    CONSTRAINT department_pkey PRIMARY KEY (id),
    CONSTRAINT department_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.department
    OWNER to postgres;