INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801'
), (
    'Jane',
    'Smith',
    'fake2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801'
), (
    'John',
    'Doe',
    'jd2@aquent.com',
    '123 Some St.',
    'Asheville',
    'NC',
    '28805'
);

INSERT INTO client (
	company_name,
    website,
    phone,
    p_street_address,
    p_city,
    p_state,
    p_zip_code,
    m_street_address,
    m_city,
    m_state,
    m_zip_code
) VALUES(
 		'acme',
 		'www.acme.com',
 		'555-555-5555',
 		'10 main st',
 		'asheville',
 		'nc',
 		'28801',
 		'p.o. box 12',
 		'asheville',
 		'nc',
 		'28801'),
 		(
 		'sears',
 		'www.sears.com',
 		'555-555-5555',
 		'1 eastway dr',
 		'charlotte',
 		'nc',
 		'27877',
 		'p.o. box 12',
 		'asheville',
 		'nc',
 		'28801');
