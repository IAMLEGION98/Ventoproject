-- Table: public."user"

-- DROP TABLE public."user";

CREATE TABLE public."user"
(
    id integer NOT NULL,
    name text,
    dept_id integer,
    CONSTRAINT user_pkey PRIMARY KEY (id),
    CONSTRAINT fk_user_dept_id FOREIGN KEY (dept_id)
        REFERENCES public.department (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to postgres;