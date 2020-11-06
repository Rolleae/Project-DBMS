create table managers(
    manager_id int primary key,
    created_date date,
    status bool,
    name varchar(50)
);
create table products(
    product_id int primary key,
    name text,
    description text
);
create table verificators(
    verificator_id int primary key,
    created_date date,
    status bool,
    name varchar(50)
);
create table documents(
    document_id int primary key,
    type_of_document varchar(20),
    document_issue_date date,
    document_valid_until date
);
create table borrower(
    borrower_id int primary key,
    created_at date,
    created_by int,
    address text,
    birth_date date,
    children int,
    document_id int,
    education varchar(30),
    phone varchar(15),
    email varchar(50),
    name text,
    gender boolean,
    marital_status varchar(20),
    salary int,
    foreign key(created_by)
    references managers(manager_id),
    foreign key(document_id)
    references documents(document_id)
);
create table credit(
    credit_id int primary key,
    disbursement_date date,
    product_id int,
    foreign key(product_id)
    references products(product_id),
    amount int,
    term int,
    status varchar(20),
    borrower_id int,
    foreign key(borrower_id)
    references borrower(borrower_id),
    credit_application_id int,
    EIR float
);
create table credit_application(
    credit_application_id int primary key,
    requested_at date,
    product_id int,
    foreign key(product_id)
    references products(product_id),
    status varchar(20),
    created_by int,
    foreign key(created_by)
    references managers(manager_id),
    requested_amount int,
    approved_amount int,
    requested_term int,
    approved_term int,
    credit_id int,
    disbursement_date date,
    borrower_id int,
    foreign key(borrower_id)
    references borrower(borrower_id),
    verificator_id int,
    foreign key(verificator_id)
    references verificators(verificator_id)
);

alter table credit
add constraint fk foreign key(credit_application_id)
references credit_application(credit_application_id);

insert into managers (manager_id, created_date, status, name) values (1, '03-Aug-1991', true, 'Erena Brimm');
insert into managers (manager_id, created_date, status, name) values (2, '20-Sep-1988', true, 'Adella Northern');
insert into managers (manager_id, created_date, status, name) values (3, '27-Jul-1993', true, 'Morten Bodiam');
insert into managers (manager_id, created_date, status, name) values (4, '21-Nov-1992', true, 'Georgiana Sazio');
insert into managers (manager_id, created_date, status, name) values (5, '03-Oct-1986', false, 'Gasper Royan');
insert into managers (manager_id, created_date, status, name) values (6, '13-Jan-1989', true, 'Berk Davydychev');
insert into managers (manager_id, created_date, status, name) values (7, '30-Apr-1984', false, 'Frederigo MacSorley');
insert into managers (manager_id, created_date, status, name) values (8, '01-Aug-1993', false, 'Ondrea Grund');
insert into managers (manager_id, created_date, status, name) values (9, '13-Nov-1987', false, 'Hattie Pantry');
insert into managers (manager_id, created_date, status, name) values (10, '25-Jan-1986', false, 'Stormy Janaud');

insert into verificators (verificator_id, created_date, status , name) values (1, '14-Sep-1984', true, 'Early Umney');
insert into verificators (verificator_id, created_date, status , name) values (2, '24-Sep-1989', true, 'Shayla Phelp');
insert into verificators (verificator_id, created_date, status , name) values (3, '15-Oct-1985', true, 'Erin Deinhardt');
insert into verificators (verificator_id, created_date, status , name) values (4, '15-Dec-1991', false, 'Bram Denington');
insert into verificators (verificator_id, created_date, status , name) values (5, '31-Mar-1983', false, 'Arny Tack');

insert into products (product_id,name,description) values (1,'mortgage','a loan from a bank or other financial institution that helps a borrower purchase a home');
insert into products (product_id,name,description) values (2,'cash loan','a short-term personal installment loan you can use to cover an unexpected expense or emergency');
insert into products (product_id,name,description) values (3,'car loan',' you receive your money in a lump sum, then pay it back (plus interest) over time');
insert into products (product_id,name,description) values (4,'credit card','A credit card is a payment card issued to users (cardholders) to enable the cardholder to pay a merchant for goods and services based on the cardholder''s promise to the card issuer to pay them for the amounts plus the other agreed charges.');

insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (1, 'id', '04-Nov-2005', '30-Oct-2015');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (2, 'id', '13-Apr-2010', '12-Sep-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (3, 'passport', '25-Jul-1991', '29-May-2001');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (4, 'id', '12-May-2010', '24-Feb-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (5, 'passport', '28-May-2012', '11-Apr-2022');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (6, 'passport', '07-Mar-2002', '25-May-2012');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (7, 'id', '04-May-1990', '04-May-2000');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (8, 'passport', '26-Jan-2007', '13-Jun-2017');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (9, 'id', '17-May-2014', '10-Sep-2024');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (10, 'id', '17-Apr-2009', '17-Apr-2019');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (11, 'passport', '13-Nov-2010', '07-Jan-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (12, 'passport', '05-Nov-2013', '27-Jul-2023');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (13, 'id', '16-Oct-2015', '27-May-2025');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (14, 'id', '06-Feb-1994', '28-May-2004');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (15, 'id', '16-Jun-2010', '17-Feb-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (16, 'id', '10-Jul-2001', '14-Jul-2011');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (17, 'passport', '17-May-2004', '05-May-2014');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (18, 'passport', '20-Nov-2013', '17-Oct-2013');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (19, 'id', '06-Nov-2009', '02-Dec-2019');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (20, 'id', '18-Nov-2011', '02-May-2021');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (21, 'passport', '21-Oct-2009', '26-Dec-2019');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (22, 'id', '19-Dec-2005', '26-Aug-2015');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (23, 'id', '14-May-2011', '25-Jul-2021');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (24, 'passport', '03-Mar-2012', '21-Jun-2022');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (25, 'id', '25-Apr-2016', '27-Jan-2026');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (26, 'passport', '14-Oct-2019', '17-Nov-2029');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (27, 'id', '23-Aug-2002', '25-May-2012');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (28, 'passport', '15-Aug-2006', '11-Sep-2016');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (29, 'passport', '14-Jul-2012', '29-Mar-2022');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (30, 'id', '09-Sep-2010', '11-Mar-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (31, 'id', '25-Jan-2017', '08-Nov-2027');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (32, 'passport', '16-Jun-2004', '27-Mar-2014');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (33, 'id', '27-May-2001', '02-Feb-2011');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (34, 'id', '03-Oct-2014', '11-Aug-2024');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (35, 'passport', '02-Jun-2005', '16-Nov-2015');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (36, 'passport', '30-Jun-2016', '25-Sep-2026');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (37, 'id', '16-Jan-1995', '29-Dec-2005');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (38, 'passport', '17-Jun-2019', '28-Jan-2029');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (39, 'id', '27-Jul-2014', '24-Jun-2024');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (40, 'id', '23-Aug-2005', '16-Nov-2015');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (41, 'passport', '26-Jan-2010', '16-Jan-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (42, 'id', '01-Jun-2006', '19-Sep-2016');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (43, 'id', '26-Nov-2002', '23-Jan-2012');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (44, 'passport', '07-Jan-2014', '16-May-2024');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (45, 'passport', '14-Mar-2010', '12-May-2020');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (46, 'id', '08-Mar-2017', '01-Jun-2029');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (47, 'passport', '17-Nov-2009', '18-Nov-2019');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (48, 'id', '31-Aug-2012', '24-Apr-2022');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (49, 'passport', '03-Jan-2011', '06-Oct-2021');
insert into documents (document_id, type_of_document, document_issue_date, document_valid_until) values (50, 'passport', '05-Sep-2010', '01-Apr-2020');

alter table borrower alter column education type varchar(100);

insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (1, '28-Jun-2011', 4, '4 Melvin Point', '05-Nov-1981', 2, 1, 'University of Zimbabwe', '146-420-9867', 'msanzio0@hhs.gov', 'Mufi Sanzio', true, 'married', 80000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (2, '05-Oct-2013', 2, '82282 Dahle Junction', '03-Aug-1990', 0, 2, 'Ibaraki Christian College', '148-241-8804', 'ybussel1@vinaora.com', 'Yolanda Bussel', true, 'single', 85000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (3, '24-Jul-1999', 7, '9 Saint Paul Road', '30-Oct-1978', 3, 3, 'Omar Al-Mukhtar University', '462-154-2083', 'gtott2@yellowpages.com', 'Goldi Tott', true, 'married', 120000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (4, '21-Nov-2015', 5, '724 Esker Alley', '16-Apr-1989', 0, 4, 'ITT Technical Institute West Covina', '202-551-8717', 'mstare3@ucsd.edu', 'Melisenda Stare', false, 'single',100000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (5, '29-May-2013', 5, '35 Carioca Center', '07-Jun-1987', 1, 5, 'Central University of Finance and Economics', '503-992-6108', 'acurd4@surveymonkey.com', 'Akim Curd', true, 'divorced', 90000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (6, '17-Dec-2006', 9, '5274 David Drive', '28-Sep-1980', 0, 6, 'The Tulane University of New Orleans', '695-636-3619', 'ecolthard5@narod.ru', 'Ezra Colthard', false, 'single', 75000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (7, '29-Oct-1997', 2, '00666 Vidon Park', '08-Oct-1979', 3, 7, 'Bowen University', '773-629-5515', 'rscamerdine6@who.int', 'Rivy Scamerdine', true, 'married', 95000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (8, '18-Jan-2013', 6, '7896 Stuart Pass', '21-Apr-1980', 4, 8, 'SASTRA Deemed University', '655-595-8265', 'mcollingham7@alexa.com', 'Malorie Collingham', false, 'married', 150000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (9, '24-Jan-2015', 9, '1 Pepper Wood Street', '17-Apr-1997', 0, 9, 'East Ukrainian National University', '201-762-9046', 'cbrunelli8@prnewswire.com', 'Corrina Brunelli', false, 'single', 60000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (10, '18-Aug-2017', 10, '65 Fairfield Street', '28-Sep-1990', 0, 10, 'University of East Srarajevo', '834-468-2032', 'kmccrackem9@cnn.com', 'Kev McCrackem', true, 'single', 180000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (11, '22-May-2016', 2, '731 Susan Park', '17-Apr-1983', 2, 11, 'Universidad Nacional Experimental de los Llanos Occidentales "Ezequiel Zamora"', '343-283-4893', 'hsturmana@sogou.com', 'Hercule Sturman', true, 'divorced', 140000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (12, '26-Jun-2019', 5, '7458 Northwestern Drive', '26-Nov-1995', 0, 12, 'Universidade Candido Mendes', '943-955-4381', 'mhanfreyb@senate.gov', 'Melita Hanfrey', false, 'single', 45000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (13, '01-Oct-2019', 3, '41125 Merchant Place', '21-May-1999', 0, 13, 'Hamdard University', '197-947-2258', 'roakeyc@ask.com', 'Rina Oakey', false, 'single', 60000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (14, '01-Nov-2000', 9, '0646 Kim Street', '26-Jun-1976', 3, 14, 'Universidad Capitain General Gerardo Barrios', '933-800-1068', 'nwyvilld@macromedia.com', 'Nisse Wyvill', false, 'single', 140000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (15, '09-Jun-2014', 6, '4 Scott Trail', '11-Dec-1992', 0, 15, 'RKDF University', '632-986-0685', 'cphipparde@cnn.com', 'Courtney Phippard', false, 'single', 87000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (16, '20-Apr-2002', 10, '308 High Crossing Terrace', '28-Apr-1981', 4, 16, 'Deakin University', '277-683-3138', 'tandreonef@google.co.jp', 'Tonie Andreone', true, 'married', 160000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (17, '13-Dec-2012', 7, '14210 Northland Terrace', '08-Jul-1985', 1, 17, 'Poole Gakuin University', '457-623-3342', 'edilksg@kickstarter.com', 'Erminie Dilks', true, 'divorced', 109000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (18, '22-May-2013', 8, '86716 Briar Crest Crossing', '26-Apr-1988', 2, 18, 'Heriot-Watt University', '754-621-1513', 'cloodyh@wordpress.com', 'Cammi Loody', false, 'married', 98000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (19, '01-Nov-2010', 1, '616 Eliot Terrace', '06-Mar-1982', 1, 19, 'Dijla University College', '722-705-0637', 'asnelli@angelfire.com', 'Amanda Snell', false, 'married', 190000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (20, '01-Apr-2017', 4, '1 Kensington Drive', '26-Jul-1996', 0, 20, 'Wonkwang University', '632-511-9362', 'dtrumpeterj@theatlantic.com', 'Dido Trumpeter', true, 'married', 200000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (21, '29-Dec-2016', 9, '6602 Jana Junction', '06-Dec-1992', 0, 21, 'Aomori University', '340-288-6741', 'akettlesingk@wisc.edu', 'Allissa Kettlesing', false, 'single', 210000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (22, '05-Oct-2009', 2, '0862 Portage Court', '03-Apr-1987', 2, 22, 'Universidad Autónoma del Carmen', '718-758-7497', 'mbronotl@twitpic.com', 'Marthena Bronot', false, 'married', 78000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (23, '28-Jan-2013', 7, '4 Cordelia Terrace', '10-Jun-1990', 0, 23, 'Slovak University of Technology in Bratislava', '632-273-2102', 'zperassim@ebay.com', 'Zacharie Perassi', true, 'married', 23000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (24, '07-Aug-2018', 10, '2 Old Gate Drive', '23-Sep-1999', 0, 24, 'Mount St. Mary''s College California', '165-109-2294', 'nbalasn@geocities.jp', 'Nealy Balas', true, 'single', 47000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (25, '09-Jan-2020', 5, '478 Wayridge Junction', '12-Jul-2000', 0, 25, 'Chengdu University of Technology', '720-601-4708', 'aheinoo@ebay.com', 'Aksel Heino', true, 'single', 25000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (26, '10-Jan-2020', 6, '5909 Ramsey Circle', '08-Sep-1999', 0, 26, 'Viterbo State University', '277-246-3054', 'bcudp@godaddy.com', 'Beale Cud', true, 'single', 260000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (27, '12-Nov-2010', 1, '5413 Chive Parkway', '06-Jun-1987', 2, 27, 'University School of Physical Education', '643-683-5064', 'lweallq@sun.com', 'Lorrie Weall', false, 'divorced', 170000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (28, '30-Jan-2012', 8, '1 Macpherson Drive', '01-Mar-1985', 3, 28, 'University of Economics Varna', '402-101-0036', 'mroyler@themeforest.net', 'Margret Royle', false, 'married', 400000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (29, '01-Oct-2018', 3, '0 Esker Road', '07-Jul-1995', 1, 29, 'Capella University', '720-366-1861', 'rbrignells@wikimedia.org', 'Rosella Brignell', false, 'married', 90000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (30, '07-Jun-2017', 3, '3688 Southridge Pass', '18-Dec-1997', 0, 30, 'Weill Medical College of Cornell University', '116-835-8377', 'mvant@fema.gov', 'Mohandas Van Hault', true, 'single', 300000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (31, '18-Aug-2020', 4, '05 Jackson Plaza', '24-Aug-1991', 3, 31, 'College of the Atlantic', '657-363-9469', 'gsoutherillu@sun.com', 'Godwin Southerill', true, 'married', 310000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (32, '26-Oct-2008', 9, '00 Atwood Trail', '24-Sep-1985', 2, 32, 'Technological University (Taungoo)', '320-661-9183', 'fclutheramv@baidu.com', 'Fara Clutheram', false, 'married', 85000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (33, '05-Jul-2003', 10, '2 Vermont Hill', '18-Mar-1982', 1, 33, 'Baylor University', '335-486-5573', 'acamplenw@domainmarket.com', 'Alonzo Camplen', true, 'married', 136000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (34, '02-Jan-2017', 2, '21589 Atwood Park', '10-Jun-1998', 0, 34, 'Universidade Nova de Lisboa', '457-476-6529', 'dawdex@fema.gov', 'Deane Awde', true, 'single', 56000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (35, '26-Jul-2009', 5, '73177 Buhler Place', '07-Apr-1986', 0, 35, 'Korea Advanced Institute of Science & Technology', '658-904-9414', 'cdiwelly@mediafire.com', 'Collete Diwell', true, 'married', 350000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (36, '01-Oct-2016', 6, '5 American Drive', '14-Jan-1993', 0, 36, 'Steinbeis-Hochschule-Berlin', '509-569-4685', 'ckeattchz@eepurl.com', 'Cassius Keattch', true, 'single', 105000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (37, '08-Jul-2002', 7, '20 Warbler Trail', '29-Aug-1983', 3, 37, 'Chongqing Normal University', '448-170-7362', 'cbetton10@phpbb.com', 'Carlin Betton', false, 'married', 217000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (38, '23-Jan-2020', 8, '08 Hintze Plaza', '18-Jan-1998', 0, 38, 'Novosibirsk State Technical University', '717-986-6278', 'tmc11@businessinsider.com', 'Tan Mc Giffin', true, 'single', 72000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (39, '08-Aug-2019', 1, '1 Portage Hill', '05-Dec-1996', 0, 39, 'Universidad Juan Misael Saracho', '888-489-2600', 'ewedmore12@lulu.com', 'Ellissa Wedmore', false, 'single', 187000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (40, '12-Dec-2007', 9, '891 6th Point', '18-Jul-1980', 4, 40, 'Eastern Virginia Medical School', '359-645-3647', 'mbon13@google.com', 'Matt Bon', true, 'married', 400000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (41, '23-Jan-2012', 8, '932 Harbort Road', '17-Feb-1987', 4, 41, 'Zhengzhou Grain University', '666-431-9494', 'jlabro0@tmall.com', 'Joy Labro', true, 'married', 900000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (42, '15-Sep-2009', 3, '86671 Moland Alley', '8-Aug-1988', 4, 42, 'The Maryland Institute, College of Art', '889-104-1611', 'nwayon1@ehow.com', 'Nehemiah Wayon', true, 'married', 74000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (43, '29-Jul-2005', 5, '702 American Park', '2-Dec-1985', 4, 43, 'Universidad Albert Einstein', '719-855-8923', 'nnewvell2@va.gov', 'Nichole Newvell', false, 'married', 430000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (44, '29-Oct-2017', 10, '40069 Upham Plaza', '11-Jan-1995', 4, 44, 'Ufa State Aviation Technical University', '875-992-3152', 'mcolliber3@odnoklassniki.ru', 'Maria Colliber', false, 'married', 120000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (45, '20-Jun-2011', 7, '92198 Pearson Terrace', '8-Sep-1990', 2, 45, 'Rajasthan Vidyapeeth University', '538-523-2544', 'tmiquelet4@cyberchimps.com', 'Thomasina Miquelet', true, 'married', 170000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (46, '26-Nov-2019', 2, '90778 Vera Circle', '5-Oct-1992', 2, 46, 'Université Badji Mokhtar', '379-669-0655', 'eovize5@jiathis.com', 'Eleanora Ovize', false, 'married', 290000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (47, '03-Sep-2020', 7, '3796 Division Place', '3-Dec-1996', 5, 47, 'Asbury College', '324-362-9144', 'cabrahams6@microsoft.com', 'Catlee Abrahams', true, 'married', 117000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (48, '21-Nov-2019', 5, '37 Hudson Crossing', '4-Jun-1993', 3, 48, 'Union University', '235-668-4515', 'trabjohn7@list-manage.com', 'Tiertza Rabjohn', false, 'married', 95000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (49, '23-Aug-2016', 1, '1636 Hauk Hill', '6-Jul-1990', 3, 49, 'University of Lecce', '437-133-1611', 'hnudde8@hp.com', 'Helen Nudde', false, 'married', 320000);
insert into borrower (borrower_id, created_at, created_by, address, birth_date, children, document_id, education, phone, email, name, gender, marital_status, salary) values (50, '27-Aug-2018', 4, '5 Hooker Trail', '5-May-1991', 6, 50, 'Mount St. Clare College', '891-735-2637', 'ghollows9@irs.gov', 'Gasper Hollows', true, 'married', 85000);

insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (1, '28-May-2011', 3, 'rejected', 9, 3300000, null, 48, null, null, null, 1, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (2, '25-Mar-2012', 4, 'cancelled', 9, 400000, 400000, 24, 12, null, null, 1, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (3, '30-Mar-2012', 3, 'approved', 1, 3000000, 3000000, 24, 24, 1, '14-Apr-2012', 1, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (4, '05-Oct-2013', 2, 'rejected', 3, 50000000, null, 60, null, null, null, 2, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (5, '25-Dec-2013', 4, 'cancelled', 6, 7500000, 6000000, 24, 24, null, null, 2, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (6, '30-Jan-2014', 4, 'approved', 5, 6000000, 6000000, 24, 24, 2, '14-Feb-2014', 2, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (7, '24-Jul-1999', 1, 'rejected', 2, 800000, null, 36, null, null, null, 3, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (8, '27-Aug-1999', 1, 'cancelled', 4, 400000, 400000, 24, 18, null, null, 3, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (9, '17-Mar-2000', 3, 'approved', 1, 2500000, 2300000, 30, 30, 3, '30-Mar-2000', 3, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (10, '28-Nov-2015', 3, 'rejected', 9, 3300000, null, 48, null, null, null, 4, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (11, '25-Mar-2016', 2, 'cancelled', 7, 400000, 400000, 24, 12, null, null, 4, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (12, '30-Mar-2016', 1, 'approved', 4, 3000000, 3000000, 36, 36, 4, '14-Apr-2016', 4, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (13, '29-May-2013', 3, 'rejected', 3, 1200000, null, 30, null, null, null, 5, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (14, '25-Aug-2013', 2, 'cancelled', 8, 5600000, 4000000, 36, 12, null, null, 5, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (15, '26-Feb-2014', 4, 'approved', 10, 12000000, 10000000, 60, 60, 5, '14-Mar-2014', 5, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (16, '17-Dec-2006', 4, 'rejected', 5, 3800000, null, 24, null, null, null, 6, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (17, '25-Mar-2007', 1, 'cancelled', 9, 955000, 500000, 48, 36, null, null, 6, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (18, '02-Sep-2008', 3, 'approved', 1, 7600000, 7600000, 60, 60, 6, '18-Sep-2008', 6, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (19, '29-Oct-1997', 2, 'rejected', 2, 530000, null, 18, null, null, null, 7, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (20, '25-Mar-2000', 1, 'cancelled', 10, 400000, 400000, 24, 12, null, null, 7, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (21, '12-Apr-2002', 2, 'approved', 9, 870000, 870000, 36, 36, 7, '28-Apr-2012', 7, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (22, '18-Jan-2013', 3, 'rejected', 6, 500000, null, 30, null, null, null, 8, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (23, '25-Aug-2013', 4, 'cancelled', 9, 650000, 650000, 24, 12, null, null, 8, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (24, '03-Dec-2013', 3, 'approved', 1, 470000, 470000, 24, 24, 8, '20-Dec-2013', 8, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (25, '24-Jan-2015', 1, 'rejected', 10, 5100000, null, 48, null, null, null, 9, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (26, '25-Sep-2015', 2, 'cancelled', 2, 785000, 700000, 30, 18, null, null, 9, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (27, '13-Jul-2016', 3, 'approved', 7, 970000, 970000, 24, 24, 9, '31-Jul-2016', 9, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (28, '18-Aug-2017', 3, 'rejected', 10, 4785000, null, 48, null, null, null, 10, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (29, '02-Mar-2019', 2, 'cancelled', 3, 2315000, 2315000, 60, 30, null, null, 10, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (30, '27-Feb-2020', 2, 'approved', 3, 3000000, 3000000, 48, 48, 10, '14-Mar-2020', 10, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (31, '22-May-2016', 3, 'rejected', 3, 789000, null, 48, null, null, null, 11, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (32, '25-Jun-2016', 2, 'cancelled', 1, 455000, 250000, 24, 24, null, null, 11, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (33, '21-Nov-2016', 1, 'approved', 9, 690000, 690000, 42, 42, 11, '05-Dec-2016', 11, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (34, '26-Jun-2019', 2, 'rejected', 7, 4550000, null, 48, null, null, null, 12, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (35, '17-Aug-2019', 2, 'cancelled', 4, 7000000, 4560000, 24, 12, null, null, 12, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (36, '18-Apr-2020', 3, 'approved', 2, 5455000, 5455000, 36, 36, 12, '24-June-2020', 12, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (37, '10-Jan-2019', 3, 'rejected', 2, 478000, null, 48, null, null, null, 13, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (38, '25-Mar-2019', 2, 'cancelled', 5, 6556000, 6556000, 24, 18, null, null, 13, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (39, '30-Sep-2019', 3, 'approved', 10, 7900000, 7900000, 72, 72, 13, '14-Oct-2019', 13, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (40, '11-Jan-2000', 1, 'rejected', 6, 235000, null, 36, null, null, null, 14, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (41, '08-May-2002', 3, 'cancelled', 7, 368000, 270000, 18, 18, null, null, 14, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (42, '24-Dec-2003', 4, 'approved', 4, 1250000, 1250000, 30, 30, 14, '14-Dec-2004', 14, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (43, '09-Jun-2014', 3, 'rejected', 9, 85000, null, 24, null, null, null, 15, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (44, '20-Nov-2014', 2, 'cancelled', 8, 110000, 75000, 24, 12, null, null, 15, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (45, '23-May-2015', 4, 'approved', 1, 235000, 235000, 18, 18, 15, '09-June-2015', 15, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (46, '20-Apr-2002', 3, 'rejected', 7, 54000, null, 24, null, null, null, 16, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (47, '15-Oct-2004', 4, 'cancelled', 3, 128000, 95000, 18, 12, null, null, 16, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (48, '17-Mar-2005', 3, 'approved', 2, 107000, 107000, 18, 18, 16, '03-Apr-2005', 16, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (49, '13-Dec-2012', 1, 'rejected', 4, 470000, null, 48, null, null, null, 17, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (50, '27-Mar-2013', 4, 'cancelled', 6, 521000, 521000, 48, 36, null, null, 17, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (51, '04-Jul-2014', 3, 'approved', 7, 678000, 678000, 48, 48, 17, '23-Jul-2014', 17, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (52, '22-May-2013', 3, 'rejected', 1, 45000, null, 48, null, null, null, 18, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (53, '17-Jan-2014', 1, 'cancelled', 8, 780000, 620000, 48, 48, null, null, 18, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (54, '09-Nov-2014', 3, 'approved', 5, 450000, 450000, 36, 36, 18, '22-Nov-2014', 18, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (55, '01-Nov-2010', 3, 'rejected', 2, 741000, null, 48, null, null, null, 19, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (56, '25-Mar-2012', 4, 'cancelled', 3, 5600000, 5600000, 84, 72, null, null, 19, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (57, '19-Mar-2013', 3, 'approved', 8, 120000000, 12000000, 120, 120, 19, '08-Apr-2013', 19, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (58, '01-Apr-2017', 3, 'rejected', 8, 490000, null, 30, null, null, null, 20, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (59, '15-Sep-2017', 2, 'cancelled', 10, 785000, 785000, 48, 42, null, null, 20, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (60, '04-Jan-2018', 1, 'approved', 1, 1450000, 1450000, 48, 48, 20, '25-Jan-2018', 20, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (61, '29-Dec-2016', 2, 'rejected', 5, 4520000, null, 96, null, null, null, 21, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (62, '25-Nov-2018', 2, 'cancelled', 3, 7500000, 7000000, 120, 120, null, null, 21, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (63, '02-Mar-2020', 3, 'approved', 4, 6200000, 6200000, 120, 120, 21, '20-Mar-2020', 21, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (64, '05-Oct-2009', 4, 'rejected', 10, 50000, null, 12, null, null, null, 22, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (65, '13-May-2010', 1, 'cancelled', 9, 310000, 200000, 18, 12, null, null, 22, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (66, '14-Aug-2012', 2, 'approved', 6, 215000, 215000, 18, 18, 22, '31-Aug-2014', 22, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (67, '28-Jan-2013', 3, 'rejected', 9, 3300000, null, 48, null, null, null, 23, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (68, '01-Mar-2013', 4, 'cancelled', 9, 400000, 400000, 24, 12, null, null, 23, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (69, '30-Sep-2014', 3, 'approved', 1, 3000000, 3000000, 24, 24, 23, '18-Oct-2014', 23, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (70, '07-Aug-2018', 2, 'rejected', 2, 856000, null, 30, null, null, null, 24, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (71, '29-Oct-2018', 2, 'cancelled', 3, 2200000, 2000000, 60, 48, null, null, 24, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (72, '17-Apr-2019', 3, 'approved', 7, 3000000, 3000000, 60, 60, 24, '17-Apr-2019', 24, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (73, '09-Jan-2020', 3, 'rejected', 8, 70000, null, 24, null, null, null, 25, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (74, '25-Mar-2020', 4, 'cancelled', 5, 80000, 80000, 18, 12, null, null, 25, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (75, '30-Aug-2020', 3, 'approved', 1, 90000, 90000, 18, 18, 25, '14-Sep-2020', 25, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (76, '10-Jan-2020', 1, 'rejected', 10, 5000000, null, 120, null, null, null, 26, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (77, '02-Feb-2020', 3, 'cancelled', 9, 6000000, 5000000, 120, 120, null, null, 26, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (78, '18-Apr-2020', 3, 'approved', 2, 5000000, 5000000, 96, 96, 26, '02-May-2020', 26, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (79, '12-Nov-2010', 3, 'rejected', 9, 255000, null, 36, null, null, null, 27, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (80, '29-Feb-2012', 4, 'cancelled', 9, 400000, 400000, 30, 24, null, null, 27, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (81, '30-Sep-2012', 3, 'approved', 1, 365000, 365000, 24, 24, 27, '14-Oct-2012', 27, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (82, '30-Jan-2012', 3, 'rejected', 10, 3300000, null, 48, null, null, null, 28, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (83, '25-Apr-2014', 4, 'cancelled', 6, 400000, 400000, 24, 12, null, null, 28, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (84, '03-Jun-2016', 2, 'approved', 1, 3000000, 3000000, 24, 24, 28, '21-Jun-2016', 28, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (85, '01-Oct-2018', 3, 'rejected', 8, 648000, null, 48, null, null, null, 29, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (86, '25-Oct-2018', 4, 'cancelled', 2, 760000, 760000, 48, 42, null, null, 29, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (87, '11-Sep-2019', 3, 'approved', 6, 800000, 800000, 48, 48, 29, '30-Sep-2019', 29, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (88, '07-Jun-2017', 3, 'rejected', 9, 3300000, null, 48, null, null, null, 30, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (89, '01-Dec-2019', 4, 'cancelled', 9, 400000, 400000, 24, 12, null, null, 30, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (90, '24-Apr-2020', 3, 'approved', 1, 3000000, 3000000, 24, 24, 30, '09-May-2020', 30, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (91, '18-Aug-2020', 3, 'approved', 1, 85000, 85000, 12, 12, 31, '05-Aug-2020', 31, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (92, '26-Oct-2008', 2, 'approved', 2, 5000000, 4700000, 72, 72, 32, '12-Nov-2008', 32, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (93, '05-Jul-2003', 4, 'approved', 7, 4500000, 4500000, 84, 84, 33, '18-Jul-2003', 33, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (94, '02-Jun-2017', 3, 'approved', 10, 785000, 760000, 36, 36, 34, '20-Jun-2017', 34, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (95, '26-Jul-2009', 1, 'approved', 4, 125000, 125000, 24, 18, 35, '09-Aug-2009', 35, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (96, '01-Oct-2016', 1, 'approved', 2, 265000, 265000, 36, 36, 36, '18-Oct-2016', 36, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (97, '08-Jul-2002', 2, 'approved', 5, 6540000, 6500000, 56, 56, 37, '22-Jul-2002', 37, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (98, '23-Jun-2020', 4, 'approved', 7, 150000, 150000, 24, 24, 38, '10-Feb-2020', 38, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (99, '08-Aug-2019', 4, 'approved', 8, 57000, 57000, 12, 12, 39, '25-Aug-2019', 39, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (100, '12-Dec-2007', 2, 'approved', 1, 45000, 45000, 6, 6, 40, '25-Dec-2007', 40, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (101, '23-Jan-2012', 3, 'approved', 1, 120000, 120000, 18, 18, 41, '10-Feb-2012', 41, 4);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (102, '15-Sep-2009', 4, 'approved', 2, 156000, 156000, 24, 24, 42, '30-Sep-2009', 42, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (103, '29-Jul-2005', 1, 'approved', 4, 784000, 784000, 36, 36, 43, '12-Aug-2005', 43, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (104, '29-Oct-2017', 2, 'approved', 10, 2150000, 2150000, 60, 60, 44, '17-Nov-2017', 44, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (105, '20-Jun-2011', 2, 'approved', 3, 5610000, 5610000, 120, 96, 45, '08-Aug-2011', 45, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (106, '26-Nov-2019', 4, 'approved', 5, 45000, 45000, 6, 6, 46, '12-Dec-2019', 46, 5);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (107, '03-Sep-2020', 1, 'approved', 6, 87000, 87000, 6, 6, 47, '20-Sep-2020', 47, 1);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (108, '21-Nov-2019', 4, 'approved', 7, 96000, 96000, 12, 12, 48, '10-Dec-2019', 48, 2);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (109, '23-Aug-2016', 4, 'approved', 9, 190000, 190000, 24, 24, 49, '09-Sep-2016', 49, 3);
insert into credit_application (credit_application_id, requested_at, product_id, status, created_by, requested_amount, approved_amount, requested_term, approved_term, credit_id, disbursement_date, borrower_id, verificator_id) values (110, '27-Aug-2018', 3, 'approved', 8, 215000, 215000, 24, 24, 50, '15-Sep-2018', 50, 5);

insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (1, '14-Apr-2012', 3, 3000000, 24, 'Finished', 1, 3, 10.8);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (2, '14-Feb-2014', 4, 6000000, 24, 'Finished', 2, 6, 5.29);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (3, '30-Mar-2000', 3, 2300000, 30, 'Finished', 3, 9, 17.61);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (4, '14-Apr-2016', 1, 3000000, 36, 'Expired', 4, 12, 9.83);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (5, '14-Mar-2014', 4, 10000000, 60, 'Finished', 5, 15, 18.55);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (6, '18-Sep-2008', 3, 7600000, 60, 'Finished', 6, 18, 12.33);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (7, '28-Apr-2012', 2, 870000, 36, 'Expired', 7, 21, 23.1);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (8, '20-Dec-2013', 3, 470000, 24, 'Finished', 8, 24, 6.55);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (9, '31-Jul-2016', 3, 970000, 24, 'Finished', 9, 27, 12.12);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (10, '14-Mar-2020', 2, 3000000, 48, 'Active', 10, 30, 26.33);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (11, '05-Dec-2016', 1, 690000, 42, 'Finished', 11, 33, 1.07);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (12, '24-Jun-2020', 3, 5455000, 36, 'Active', 12, 36, 6.57);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (13, '14-Oct-2019', 3, 7900000, 72, 'Active', 13, 39, 2.69);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (14, '14-Dec-2004', 4, 1250000, 30, 'Finished', 14, 42, 26.29);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (15, '09-Jun-2015', 4, 235000, 18, 'Expired', 15, 45, 27.97);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (16, '03-Apr-2005', 3, 107000, 18, 'Finished', 16, 48, 12.73);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (17, '23-Jul-2014', 3, 678000, 48, 'Finished', 17, 51, 8.86);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (18, '22-Nov-2014', 3, 450000, 36, 'Finished', 18, 54, 28.05);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (19, '08-Apr-2013', 3, 12000000, 120, 'Finished', 19, 57, 1.32);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (20, '25-Jan-2018', 1, 1450000, 48, 'Active', 20, 60, 12.85);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (21, '20-Mar-2020', 3, 6200000, 120, 'Active', 21, 63, 2.93);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (22, '31-Aug-2014', 2, 215000, 18, 'Finished', 22, 66, 30.0);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (23, '18-Oct-2014', 3, 3000000, 24, 'Finished', 23, 69, 13.58);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (24, '17-Apr-2019', 3, 3000000, 60, 'Active', 24, 72, 18.11);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (25, '14-Sep-2020', 3, 90000, 18, 'Active', 25, 75, 2.28);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (26, '02-May-2020', 3, 5000000, 96, 'Active', 26, 78, 29.51);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (27, '14-Oct-2012', 3, 365000, 24, 'Expired', 27, 81, 14.34);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (28, '21-Jun-2016', 2, 3000000, 24, 'Finished', 28, 84, 3.65);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (29, '30-Sep-2019', 3, 800000, 48, 'Active', 29, 87, 3.59);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (30, '09-May-2020', 3, 3000000, 24, 'Active', 30, 90, 19.38);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (31, '05-Aug-2020', 3, 85000, 12, 'Active', 31, 91, 26.83);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (32, '12-Nov-2008', 2, 4700000, 72, 'Finished', 32, 92, 17.01);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (33, '18-Jul-2003', 4, 4500000, 84, 'Finished', 33, 93, 14.1);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (34, '20-Jun-2017', 3, 760000, 36, 'Finished', 34, 94, 16.63);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (35, '09-Aug-2009', 1, 125000, 18, 'Finished', 35, 95, 23.98);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (36, '18-Oct-2016', 1, 265000, 36, 'Finished', 36, 96, 10.65);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (37, '22-Jul-2002', 2, 6500000, 56, 'Expired', 37, 97, 13.49);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (38, '10-Feb-2020', 4, 150000, 24, 'Active', 38, 98, 19.8);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (39, '25-Aug-2019', 4, 57000, 12, 'Finished', 39, 99, 5.56);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (40, '25-Dec-2007', 2, 45000, 6, 'Finished', 40, 100, 5.96);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (41, '10-Feb-2012', 3, 120000, 18, 'Finished', 41, 101, 10.72);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (42, '30-Sep-2009', 4, 156000, 24, 'Finished', 42, 102, 13.59);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (43, '12-Aug-2005', 1, 784000, 36, 'Finished', 43, 103, 11.45);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (44, '17-Nov-2017', 2, 2150000, 60, 'Active', 44, 104, 18.93);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (45, '08-Aug-2011', 2, 5610000, 96, 'Finished', 45, 105, 11.48);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (46, '12-Dec-2019', 4, 45000, 6, 'Finished', 46, 106, 19.04);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (47, '20-Sep-2020', 1, 87000, 6, 'Active', 47, 107, 14.13);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (48, '10-Dec-2019', 4, 96000, 12, 'Active', 48, 108, 24.94);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (49, '09-Sep-2016', 4, 190000, 24, 'Expired', 49, 109, 23.07);
insert into credit (credit_id, disbursement_date, product_id, amount, term, status, borrower_id, credit_application_id, EIR) values (50, '15-Sep-2018', 3, 215000, 24, 'Finished', 50, 110, 4.97);

alter table credit_application add constraint credit_application_credit_id_fkey foreign key(credit_id) references credit(credit_id);


----------------------------------------------------Triggers---------------------------------------------------------------

create table borrower_name_changes (
   id int generated always as identity ,
   borrower_id int not null,
   old_name varchar(40) not null,
   new_name varchar(40) not null,
   changed_on timestamp(6) not null
);

create or replace function log_name_changes()
  returns trigger
  language plpgsql
  as
$$
begin
	if new.name <> old.name then
		 insert into borrower_name_changes(borrower_id,old_name, new_name, changed_on)
		 VALUES(old.borrower_id,old.name, new.name, now());
	end if;

	return new;
end;
$$;

create trigger name_changes
  before update
  on borrower
  for each row
  execute procedure log_name_changes();

create table borrower_address_changes (
   id int generated always as identity ,
   borrower_id int not null,
   old_address text not null,
   new_address text not null,
   changed_on timestamp(6) not null
);

create or replace function log_address_changes()
  returns trigger
  language plpgsql
  as
$$
begin
	if new.address <> old.address then
		 insert into borrower_address_changes(borrower_id,old_address, new_address, changed_on)
		 values (old.borrower_id,old.address, new.address, now());
	end if;

	return new;
end;
$$;

create trigger address_changes
  before update
  on borrower
  for each row
  execute procedure log_address_changes();

create table borrower_phone_changes (
   id int generated always as identity ,
   borrower_id int not null,
   old_phone varchar(15) not null,
   new_phone varchar(15) not null,
   changed_on timestamp(6) not null
);

create or replace function log_phone_changes()
  returns trigger
  language plpgsql
  as
$$
begin
	if new.phone <> old.phone then
		 insert into borrower_phone_changes(borrower_id,old_phone, new_phone, changed_on)
		 values (old.borrower_id,old.phone, new.phone, now());
	end if;

	return new;
end;
$$;

create trigger phone_changes
  before update
  on borrower
  for each row
  execute procedure log_phone_changes();

----------------------------------------------------------Functions---------------------------------------------------------

create or replace function monthly_payment(id int)
returns int
language plpgsql
as
    $$
    declare
        b_amount credit.amount%type;
        b_term credit.term%type;
        b_eir credit.eir%type;
        begin
        select amount,term,eir
        into b_amount,b_term,b_eir
        from credit
        where credit_id = id;
          if not found then raise 'Borrower with credit_id % not found', id;
          end if;
        return round(((((b_eir/12)/100)*(((b_eir/12)/100)+1)^b_term)/(((1+((b_eir/12)/100))^b_term)-1))*b_amount);
    end;
    $$;
			 
------------------------------------------------------Views----------------------------------------------------------------
                 
create or replace view v_borrower as (
    select
        borrower_id,
        created_at,
        created_by,
        address,
        birth_date,
        children,
        document_id,
        education,
        phone,
        email,
        name,
        gender,
        marital_status,
        salary
    from
        borrower
);

create or replace view v_credit as (
    select
        credit_id,
        disbursement_date,
        product_id,
        amount,
        term,
        status,
        borrower_id,
        credit_application_id,
        EIR
    from
        credit
);
                 
----------------------------------------------------------Indexes----------------------------------------------------------
                 
create index index_borrower_id
    on borrower (
        borrower_id
);
create index index_name
    on borrower (
        name
);
create index index_salary
    on borrower (
        salary nulls last
);

create index index_credit_application_id
    on credit_application (
        credit_application_id
);

create index index_credit_id
    on credit (
        credit_id
);
create index index_amount
    on credit (
        amount nulls last
);
create index index_term
    on credit (
        term nulls last
);
                 
------------------------------------------------------------Procedures-----------------------------------------------------
                 
create or replace procedure change_borrower(
   id int,
   new_name varchar(30),
   new_address varchar(40),
   new_phone int
)
language plpgsql
as $$
begin
    update borrower
    set name = new_name
    where borrower_id = id;

    update borrower
    set address = new_address
    where borrower_id = id;

    update borrower
    set phone = new_phone
    where borrower_id = id;

    commit;
end;$$;
                 


