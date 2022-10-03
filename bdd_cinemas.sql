/* GESTION DES PRIVILEGES */
GRANT ALL PRIVILEGES ON * TO admin WITH GRANT OPTION;
GRANT SELECT, UPDATE, INSERT ON * TO root;


/* CREATION DE LA BDD */
CREATE DATABASE
IF NOT EXISTS theaters;


/* CREATION DES TABLES */
/* --- TABLE ADMINS --- */
CREATE TABLE ADMINS
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_admin VARCHAR
(30) NOT NULL,
    email_admin VARCHAR
(255) NOT NULL,
    password_admin VARCHAR
(30) NOT NULL
)
engine=INNODB;

/*--- TABLE THEATER_USER (le gérant de la salle) ---*/
CREATE TABLE THEATER_USER
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_user VARCHAR
(30) NOT NULL,
    eamil_user VARCHAR
(255) NOT NULL,
    password_user VARCHAR
(30) NOT NULL
)
engine = INNODB;

/* --- TABLE THEATERS --- */
CREATE TABLE THEATERS
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    movie_room VARCHAR
(100) NOT NULL,
    number_of_seat int NOT NULL,
    theater_user_id int NOT NULL,
    FOREIGN KEY
(theater_user_id) REFERENCES THEATER_USER
(id)
)
engine=INNODB;

/*--- TABLE MOVIES ---*/
CREATE TABLE MOVIES
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title_movie VARCHAR
(30),
    duration_movie TIME,
    theaters_id INT NOT NULL,
    FOREIGN KEY
(theaters_id) REFERENCES THEATERS
(id)
) engine=INNODB;

/*--- TABLE PRICES ---*/
CREATE TABLE PRICES
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    movie_price FLOAT,
    category_price VARCHAR
(30)
) engine=INNODB;

/*---TABLE PAIEMENT---*/
CREATE TABLE PAIEMENT
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    online_paiement BOOLEAN,
    on_spot_paiement BOOLEAN
) engine=INNODB;

/*---TABLE RESERVATION---*/
CREATE TABLE RESERVATION
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    theaters_id INT NOT NULL,
    FOREIGN KEY
(theaters_id) REFERENCES THEATERS
(id),
    movies_id INT NOT NULL, 
    FOREIGN KEY
(movies_id) REFERENCES MOVIES
(id),
    prices_id INT NOT NULL,
    FOREIGN KEY
(prices_id) REFERENCES PRICES
(id),
    paiement_id INT NOT NULL,
    FOREIGN KEY
(paiement_id) REFERENCES PAIEMENT
(id)
) engine=INNODB;

/*--- TABLE CUSTOMER ---*/
CREATE TABLE CUSTOMER
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_customer VARCHAR
(30),
    password_customer VARCHAR
(30)
) engine=INNODB;

/*--- ajout de customer_id a la table RESERVATION ---*/
ALTER TABLE RESERVATION
ADD customer_id INT NOT NULL

ALTER TABLE RESERVATION
ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)



/*---ajout de data factices dans les tables---*/
insert into ADMINS
    (id, name_admin, email_admin, password_admin)
values
    (1, 'Annetta Sawfoot', 'asawfoot0@accuweather.com', '$2y$10$omdZP/jVE8mBJFUKn7zXZ.k2jcXT/p8IRuZ0X.lMGArccym4LGgm.');
insert into ADMINS
    (id, name_admin, email_admin, password_admin)
values
    (2, 'Wang Leyton', 'wleyton1@t-online.de', '$2y$10$bJzIe2hxZ/n2kaayiAx18OG5cdWdXSNWmP5iFLSKcjsnSNCwNTNmW');
insert into ADMINS
    (id, name_admin, email_admin, password_admin)
values
    (3, 'Cyndia Lowensohn', 'clowensohn2@illinois.edu', '$2y$10$LNlVY8tQuJrWX4vR1iOw3ekW4dvX3GVtwQE0ntNaARgu32xi1KyCO');


insert into theater_user
    (id, name_user, email_user, password_user)
values
    (1, 'Christoper Charlwood', 'ccharlwood0@google.com', '$2y$10$jyDKK.UGTBx9Nl4wi09GKufftBpHWsTuGOYK0Iqa/uYswo7sG0lmO');
insert into theater_user
    (id, name_user, email_user, password_user)
values
    (2, 'Alexandre Burgill', 'aburgill1@cornell.edu', '$2y$10$7iqIaiuOAJydklZsBYQHyedj2NWJa9wi3ACNEGQx202Pz38PqdoCi');
insert into theater_user
    (id, name_user, email_user, password_user)
values
    (3, 'Charmian Fleury', 'cfleury2@amazon.com', '$2y$10$b4YnGVWjqOUrzy6rPOke9eBdRIMMj7Su4VXEWwFFGwTEjn2RU3wyG');


insert into THEATERS
    (id, movie_room, number_of_seat, theater_user_id)
values
    (1, 'Krzeszów', 400, 1);
insert into THEATERS
    (id, movie_room, number_of_seat, theater_user_id)
values
    (2, 'Pengfang', 180, 2);
insert into THEATERS
    (id, movie_room, number_of_seat, theater_user_id)
values
    (3, 'Tangzha', 300, 3);


insert into MOVIES
    (id, title_movie, duration_movie, theaters_id)
values
    (1, 'King of the Children (Hai zi wang)', '01:54:27', 1);
insert into MOVIES
    (id, title_movie, duration_movie, theaters_id)
values
    (2, 'Jailhouse Rock', '02:03:21', 2);
insert into MOVIES
    (id, title_movie, duration_movie, theaters_id)
values
    (3, 'Plenty', '01:31:58', 3);


insert into PRICES
    (id, movie_price, category_price)
values
    (1, '9€20', 'Plein Tarif');
insert into PRICES
    (id, movie_price, category_price)
values
    (2, '7€60', 'Etudiant');
insert into PRICES
    (id, movie_price, category_price)
values
    (3, '5€90', 'Moins de 14 ans');


insert into PAIEMENT
    (id, online_paiement, on_spot_paiement)
values
    (1, false, false);
insert into PAIEMENT
    (id, online_paiement, on_spot_paiement)
values
    (2, true, false);



insert into RESERVATION
    (id, theaters_id, movies_id, prices_id, paiement_id, customer_id)
values
    (1, 2, 1, 1, 2, 1);
insert into RESERVATION
    (id, theaters_id, movies_id, prices_id, paiement_id, customer_id)
values
    (2, 1, 2, 1, 1, 2);
insert into RESERVATION
    (id, theaters_id, movies_id, prices_id, paiement_id, customer_id)
values
    (3, 3, 1, 1, 1, 3);
insert into RESERVATION
    (id, theaters_id, movies_id, prices_id, paiement_id, customer_id)
values
    (4, 1, 2, 2, 2, 4);
insert into RESERVATION
    (id, theaters_id, movies_id, prices_id, paiement_id, customer_id)
values
    (5, 1, 2, 2, 1, 5);


insert into CUSTOMER
    (id, name_customer, password_customer)
values
    (1, 'Fidelio Iannelli', '$2y$10$XaYNFNN2DSfJLsb0XujxI.WlNElNNN3mLotRnP3X4F8Pnrep5B1U6');
insert into CUSTOMER
    (id, name_customer, password_customer)
values
    (2, 'Goldy Rockingham', '$2y$10$87.WGs303gAJgD06zhLJeuDQyguWRdNBgoMdxnMEbrNpz1VH.T1qm');
insert into CUSTOMER
    (id, name_customer, password_customer)
values
    (3, 'Brynn Callear', '$2y$10$d7FCNS7gVkewFobYlIMcretz/l6e8Mticonqbi4/pIfPLFGej2a8m');
insert into CUSTOMER
    (id, name_customer, password_customer)
values
    (4, 'Sadella Grinsdale', '$2y$10$JAmiwhSXqAQVYHs6cK.AnOqSq2UUt92GQNF81yhCVjsNuyEQPI8lC');
insert into CUSTOMER
    (id, name_customer, password_customer)
values
    (5, 'Graig Bresland', '$2y$10$2ZM9W3u4/QAlzSju9WYpPeek/bdTA8gQOuiA68oJRI.GNGHfGhCLy');
