CREATE TABLE product (
	id serial NOT NULL,
	name varchar NOT NULL,
	description TEXT,
	date_created DATE DEFAULT current_date,
	price FLOAT,
	amount integer NOT NULL,
	location_id integer,
	user_id integer NOT NULL,
	qr_code TEXT,
	inventarisation_code varchar NOT NULL,
	product_type_id integer NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE product_property (
	id serial NOT NULL,
	product_id integer NOT NULL,
	name varchar NOT NULL,
	value varchar NOT NULL,
	CONSTRAINT product_property_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE product_type (
	id serial NOT NULL,
	name varchar NOT NULL,
	CONSTRAINT product_type_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE location (
	id serial NOT NULL,
	name varchar,
	room_no varchar,
	location_type_id integer NOT NULL,
	CONSTRAINT location_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE users (
	id serial NOT NULL,
	login varchar NOT NULL UNIQUE CHECK ( char_length(login) >= 5 ),
	passwd varchar NOT NULL CHECK ( char_length(passwd) >= 5 ),
	date_created DATE DEFAULT current_date,
	full_name varchar,
	role varchar NOT NULL DEFAULT 'USER',
	CONSTRAINT user_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE location_type (
	id serial NOT NULL,
	name varchar NOT NULL,
	CONSTRAINT location_type_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);


ALTER TABLE product ADD CONSTRAINT product_fk0 FOREIGN KEY (location_id) REFERENCES location(id);
ALTER TABLE product ADD CONSTRAINT product_fk1 FOREIGN KEY (user_id) REFERENCES users(id) ;
ALTER TABLE product ADD CONSTRAINT product_fk2 FOREIGN KEY (product_type_id) REFERENCES product_type(id);
ALTER TABLE product_property ADD CONSTRAINT product_property_fk0 FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;
ALTER TABLE location ADD CONSTRAINT location_fk0 FOREIGN KEY (location_type_id) REFERENCES location_type(id);



