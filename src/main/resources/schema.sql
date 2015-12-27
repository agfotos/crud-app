CREATE TABLE person (
    person_id integer IDENTITY,
    client_id integer,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email_address varchar(50) NOT NULL,
    street_address varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    state varchar(2) NOT NULL,
    zip_code varchar(5) NOT NULL
);

CREATE TABLE ClIENT (
	client_id integer IDENTITY,
	company_name varchar(50) NOT NULL,
    website varchar(50) NOT NULL,
    phone varchar(12) NOT NULL,
    p_street_address varchar(50) NOT NULL,
    p_city varchar(50) NOT NULL,
    p_state varchar(2) NOT NULL,
    p_zip_code varchar(5) NOT NULL,
    m_street_address varchar(50) NOT NULL,
    m_city varchar(50) NOT NULL,
    m_state varchar(2) NOT NULL,
    m_zip_code varchar(5) NOT NULL
);


