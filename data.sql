
        
        CREATE SCHEMA IF NOT EXISTS `Movies_perfect` DEFAULT CHARACTER SET utf8 ;
        USE `Movies_perfect` ;

        CREATE TABLE `movies_perfect`.`languages`
        (
            language_id int not null,
            language_name VARCHAR not null,
            language_code char(2) not null,
            PRIMARY KEY(language_id)
        );
        
        CREATE TABLE `movies_perfect`.`movies`
        (
            movies_id int not null,
            movies_name VARCHAR not null,
            year_movie int not null,
            lenght_in_minuts int not null,
            language_id int not null,
            country_id char(2) not null,
            director_id int not null,
            PRIMARY key (movies_id, movies_name)
        );

        CREATE TABLE `movies_perfect`.`countries`
        (
            country_id char(3) not null,
            country_name varchar(45),
            PRIMARY KEY (country_id)
        );

        CREATE TABLE `movies_perfect`. `directors`
        (
            director_id int not null,
            director_name varcgar(45) not null,
            PRIMARY KEY (director_id)
        );

        CREATE TABLE `movies_perfect`.`genres`
        (
            genres_id int not null,
            genres_name varchar(45) not null,
            PRIMARY KEY (genres_id)
        );


        CREATE TABLE `movies_perfect`.`genres_movies`
        (
            movies_id int not null,
            genres_id int not null,
            FOREIGN KEY (movies_id)
            REFERENCES `movies_perfect`.`movies`(movies_id),
            FOREIGN KEY (genres_id)
            REFERENCES `movies_perfect`.`genres`(genres_id)
        );

        CREATE TABLE `movies_perfect`.`ratings`
        (
            movies_id int not null,
            users_id int not null,
            score VARCHAR(45) not null,
            critic VARCHAR(45),
            FOREIGN KEY (movies_id)
            REFERENCES `movies_perfect`.`movies` (movies_id),
            FOREIGN KEY (users_id)
            REFERENCES `movies_perfect`.`users` (users_id)
        );

        CREATE TABLE `movies_perfect`.`users`
        (
            users_id int not null,
            users_name VARCHAR(45) not null,
            user_brith VARCHAR(45) not null,
            email VARCHAR(45)
            PRIMARY KEY (users_id)
            
        );


        CREATE TABLE "roles"
        (
            role_id int not null,
            role_type varchar(45) not null,
            PRIMARY KEY (role_id)
        );

        CREATE TABLE "Roles_Movies"
        (
            role_id int not null,
            movies_id int not null,
            FOREIGN KEY (role_id)
            REFERENCES "roles"(role_id),
            FOREIGN key (movies_id)
            REFERENCES `movies_perfect`.`movies`(movies_id)
        );


        CREATE TABLE "Participants"
        (
            participant_id int not null,
            participant_name VARCHAR(45) not null, 
            PRIMARY KEY (participant_id)
        );

        CREATE TABLE "Role_Participants"
        (
            role_id int not null,
            participant_id int not null, 
            FOREIGN KEY (role_id)
            REFERENCES "Roles_Movies"(role_id),
            FOREIGN KEY (participant_id)
            REFERENCES "Participants"(participant_id)
        );

        INSERT INTO `movies_perfect`.`movies` VALUES (01, 'avatar',2005, 209, 1, 'US', 01  );
        INSERT INTO `movies_perfect`.`movies` VALUES (02, 'the king ',2005, 90, 5,'US', 02  );
        INSERT INTO `movies_perfect`.`movies` VALUES (03, 'terminator',2009, 112, 8,'US', 03  );
        INSERT INTO `movies_perfect`.`movies` VALUES (04, 'the blues brothers',1980, 132, 27,'ES', 04  );
        INSERT INTO `movies_perfect`.`movies` VALUES (05, 'la isla',2005, 101, 45,'AM', 05  );
        INSERT INTO `movies_perfect`.`movies` VALUES (06, 'perros de paja',2005, 89, 32,'BE', 06  );
        INSERT INTO `movies_perfect`.`movies` VALUES (07, 'moros y cristianos ',1985, 135, 27,'BR', 07  );
        INSERT INTO `movies_perfect`.`movies` VALUES (08, 'chocolat',1971, 100, 74, 'CA', 08  );
        INSERT INTO `movies_perfect`.`movies` VALUES (09, 'rain man',1987, 135, 77, 'DE', 09  );
        INSERT INTO `movies_perfect`.`movies` VALUES (10, 'calabuch',2000, 103, 56, 'CU', 10 );
        INSERT INTO `movies_perfect`.`movies` VALUES (11, 'trainspotting',1988, 97, 76,'CH', 11  );
        INSERT INTO `movies_perfect`.`movies` VALUES (12, 'taxi driver',1956, 98, 33, 'US', 12  );
        INSERT INTO `movies_perfect`.`movies` VALUES (13, 'seven',1996, 145, 34,'US', 13  );
        INSERT INTO `movies_perfect`.`movies` VALUES (14, 'harold lloid',1995, 133, 37,'US', 14  );
        INSERT INTO `movies_perfect`.`movies` VALUES (15, 'codigo 46',2005, 107, 90,'EC', 15  );
        INSERT INTO `movies_perfect`.`movies` VALUES (16, 'el señor de los anillos',2001, 130, 1,'US', 16  );
        INSERT INTO `movies_perfect`.`movies` VALUES (17, 'Nosotros decimos',2001, 99, 1,'US', 17  );
        INSERT INTO `movies_perfect`.`movies` VALUES (18, 'El viaje de chihiro',2002, 107, 120,'CL', 18  );
        INSERT INTO `movies_perfect`.`movies` VALUES (19, 'ciudad de Dios',2002, 132, 27,'ES', 19  );
        INSERT INTO `movies_perfect`.`movies` VALUES (20, 'El señor de los anillos, el retorno del rey ',2003, 145, 100,'US', 20  );
        INSERT INTO `movies_perfect`.`movies` VALUES (21, 'Entre copas',2005, 107, 56,'EC', 21  );
        INSERT INTO `movies_perfect`.`movies` VALUES (21, 'Entre copas',2005, 107, 'EC', 21  );
        INSERT INTO `movies_perfect`.`movies` VALUES (22, 'la mejor juventud ',2006, 108, 99,'TL', 22  );
        INSERT INTO `movies_perfect`.`movies` VALUES (23, 'olvidate de mi',2004, 107, 77,'EC', 23  );
        INSERT INTO `movies_perfect`.`movies` VALUES (24, 'Munich',2005, 92, 'ES', 24  );
        INSERT INTO `movies_perfect`.`movies` VALUES (25, 'El laberinto del fauno',2006, 101, 88,'MX', 25  );
        INSERT INTO `movies_perfect`.`movies` VALUES (26, 'Hijos del los hombres',2006, 78, 111,'US', 25  );
        INSERT INTO `movies_perfect`.`movies` VALUES (27, 'ratatouille',2007, 122, 11,'AR', 20  );
        INSERT INTO `movies_perfect`.`movies` VALUES (28, 'Zodiac',2007, 101, 22,'US', 22  );
        INSERT INTO `movies_perfect`.`movies` VALUES (29, 'Wall-E',2008, 98, 33,'AR', 12  );
        INSERT INTO `movies_perfect`.`movies` VALUES (30, '4 meses, 3 semanas y dos dias ',2008, 123, 91,'EC', 3  );
        INSERT INTO `movies_perfect`.`movies` VALUES (31, 'Malditos bastardos',2009, 112, 82,'US', 1  );
        INSERT INTO `movies_perfect`.`movies` VALUES (32, 'La red social',2010, 133, 73,'US', 3  );
        INSERT INTO `movies_perfect`.`movies` VALUES (33, 'Drive',2011, 100, 64,'US', 33  );
        INSERT INTO `movies_perfect`.`movies` VALUES (34, 'La hora mas oscura',2012, 95, 55,'ES', 13  );
        INSERT INTO `movies_perfect`.`movies` VALUES (35, 'call me be your name',2018, 143, 69,'ES', 9  );
                
        INSERT INTO `movies_perfect`. `directors` VALUES (01,'James Cameron');
        INSERT INTO `movies_perfect`. `directors` VALUES (02,'Stanley Kubrick');
        INSERT INTO `movies_perfect`. `directors` VALUES (03,'Quentin Tarantino');
        INSERT INTO `movies_perfect`. `directors` VALUES (04,'Alfred Hitchcock');
        INSERT INTO `movies_perfect`. `directors` VALUES (05,'Steven Spielberg');
        INSERT INTO `movies_perfect`. `directors` VALUES (06,'Martin Scorsese');
        INSERT INTO `movies_perfect`. `directors` VALUES (07,'Charles Chaplin');
        INSERT INTO `movies_perfect`. `directors` VALUES (08,'Christopher Nolan');
        INSERT INTO `movies_perfect`. `directors` VALUES (09,'FRancis Ford Coppola');
        INSERT INTO `movies_perfect`. `directors` VALUES (10,'Clint Eastwood');
        INSERT INTO `movies_perfect`. `directors` VALUES (11,'Tin Burton');
        INSERT INTO `movies_perfect`. `directors` VALUES (12,'Billy Wilder');
        INSERT INTO `movies_perfect`. `directors` VALUES (13,'Ridley Scott');
        INSERT INTO `movies_perfect`. `directors` VALUES (14,'John Ford');
        INSERT INTO `movies_perfect`. `directors` VALUES (15,'Woody Allen');
        INSERT INTO `movies_perfect`. `directors` VALUES (16,'Peter Jackson');
        INSERT INTO `movies_perfect`. `directors` VALUES (17,'Robert Zemeckis');
        INSERT INTO `movies_perfect`. `directors` VALUES (18,'Orson Welles');
        INSERT INTO `movies_perfect`. `directors` VALUES (19,'Roman Polanski');
        INSERT INTO `movies_perfect`. `directors` VALUES (20,'John Huston');
        INSERT INTO `movies_perfect`. `directors` VALUES (21,'Frank Capra');
        INSERT INTO `movies_perfect`. `directors` VALUES (22,'Howard Hawks');
        INSERT INTO `movies_perfect`. `directors` VALUES (23,'George Lucas');
        INSERT INTO `movies_perfect`. `directors` VALUES (24,'David Lean');
        INSERT INTO `movies_perfect`. `directors` VALUES (25,'William Wyler');

        INSERT INTO `movies_perfect`.`languages`VALUES (1,'English ', "EN");
        INSERT INTO `movies_perfect`.`languages`VALUES (2,' Afar ', "AA");
        INSERT INTO `movies_perfect`.`languages`VALUES (3,'Abkhazian ', "AB");
        INSERT INTO `movies_perfect`.`languages`VALUES (4,'Amharic ', "WM");
        INSERT INTO `movies_perfect`.`languages`VALUES (5,'Arabic ',"AM");
        INSERT INTO `movies_perfect`.`languages`VALUES (6,'Assamese ', "AS");
        INSERT INTO `movies_perfect`.`languages`VALUES (7,'Aymara ', "AY");
        INSERT INTO `movies_perfect`.`languages`VALUES (8,'Azerbaijani ', "AZ");
        INSERT INTO `movies_perfect`.`languages`VALUES (9,'Bashkir ', "BA");
        INSERT INTO `movies_perfect`.`languages`VALUES (10,'Belarusian ', "BE");
        INSERT INTO `movies_perfect`.`languages`VALUES (11,'Bulgarian', "BG");
        INSERT INTO `movies_perfect`.`languages`VALUES (12,'Bihari', "BH");
        INSERT INTO `movies_perfect`.`languages`VALUES (13,'Bislama ', "BI");
        INSERT INTO `movies_perfect`.`languages`VALUES (14,'Bengali/Bangla ', "BN");
        INSERT INTO `movies_perfect`.`languages`VALUES (15,'Tibetan ', "BO");
        INSERT INTO `movies_perfect`.`languages`VALUES (16,'Breton ',"BR");
        INSERT INTO `movies_perfect`.`languages`VALUES (17,'Catalan ', "CA");
        INSERT INTO `movies_perfect`.`languages`VALUES (18,'Corsican ', "CO");
        INSERT INTO `movies_perfect`.`languages`VALUES (19,'Czech ', "CS");
        INSERT INTO `movies_perfect`.`languages`VALUES (20,'Welsh ', "CY");
        INSERT INTO `movies_perfect`.`languages`VALUES (21,'Danish ', "DA");
        INSERT INTO `movies_perfect`.`languages`VALUES (22,'German ', "DE");
        INSERT INTO `movies_perfect`.`languages`VALUES (23,'Bhutani ', "DZ");
        INSERT INTO `movies_perfect`.`languages`VALUES (24,'Greek', "EL");
        INSERT INTO `movies_perfect`.`languages`VALUES (24,'Esperanto ', "EO");
        INSERT INTO `movies_perfect`.`languages`VALUES (26,'Spanish', "ES");
        INSERT INTO `movies_perfect`.`languages`VALUES (27,'Estonian', "ET");
        INSERT INTO `movies_perfect`.`languages`VALUES (28,'Basque', "EU");
        INSERT INTO `movies_perfect`.`languages`VALUES (29,'Persian', "FA");
        INSERT INTO `movies_perfect`.`languages`VALUES (30,'Finnish', "FI");
        INSERT INTO `movies_perfect`.`languages`VALUES (31,'Fiji',"FJ");
        INSERT INTO `movies_perfect`.`languages`VALUES (32,'Faeroese', "FO");
        INSERT INTO `movies_perfect`.`languages`VALUES (33,'French', "FR");
        INSERT INTO `movies_perfect`.`languages`VALUES (34,'Frisian', "FY");
        INSERT INTO `movies_perfect`.`languages`VALUES (35,'Irish', "GA");
        INSERT INTO `movies_perfect`.`languages`VALUES (36,'Scots/Gaelic', "GD");
        INSERT INTO `movies_perfect`.`languages`VALUES (37,'Galacian', "GL");
        INSERT INTO `movies_perfect`.`languages`VALUES (38,'Guarani', "GN");
        INSERT INTO `movies_perfect`.`languages`VALUES (39,'Gujarati', "GU");
        INSERT INTO `movies_perfect`.`languages`VALUES (40,'Hausa', "HA");
        INSERT INTO `movies_perfect`.`languages`VALUES (41,'Hindi', "HI");
        INSERT INTO `movies_perfect`.`languages`VALUES (42,'Croatian', "HR");
        INSERT INTO `movies_perfect`.`languages`VALUES (43,'Hungarian', "HU");
        INSERT INTO `movies_perfect`.`languages`VALUES (44,'Frisian', "FY");
        INSERT INTO `movies_perfect`.`languages`VALUES (45,'Armenian', "HY");
        INSERT INTO `movies_perfect`.`languages`VALUES (46,'Interlingua', "IA");
        INSERT INTO `movies_perfect`.`languages`VALUES (47,'Interlingue', "IE");
        INSERT INTO `movies_perfect`.`languages`VALUES (48,'Inupiak', "IK");
        INSERT INTO `movies_perfect`.`languages`VALUES (49,'Indonesian', "IK");
        INSERT INTO `movies_perfect`.`languages`VALUES (50,'Icelandic', "IS");
        INSERT INTO `movies_perfect`.`languages`VALUES (51,'Italian', "IT");
        INSERT INTO `movies_perfect`.`languages`VALUES (53,'Japanese', "JA");
        INSERT INTO `movies_perfect`.`languages`VALUES (54,'Yiddish', "JI");
        INSERT INTO `movies_perfect`.`languages`VALUES (55,'Javanese', "JW");
        INSERT INTO `movies_perfect`.`languages`VALUES (56,'Georgian', "KA");
        INSERT INTO `movies_perfect`.`languages`VALUES (57,'Kazakh', "KK");
        INSERT INTO `movies_perfect`.`languages`VALUES (58,'Greenlandic', "KL");
        INSERT INTO `movies_perfect`.`languages`VALUES (59,'Cambodian', "KM");
        INSERT INTO `movies_perfect`.`languages`VALUES (60,'Kannada', "KN");
        INSERT INTO `movies_perfect`.`languages`VALUES (61,'Korean', "KO");
        INSERT INTO `movies_perfect`.`languages`VALUES (62,'Kashmiri', "KS");
        INSERT INTO `movies_perfect`.`languages`VALUES (63,'Kurdish', "KU");
        INSERT INTO `movies_perfect`.`languages`VALUES (64,'Kirghiz', "KY");
        INSERT INTO `movies_perfect`.`languages`VALUES (65,'Latin', "LA");
        INSERT INTO `movies_perfect`.`languages`VALUES (66,'Lingala', "LN");
        INSERT INTO `movies_perfect`.`languages`VALUES (67,'Laothian', "LO");
        INSERT INTO `movies_perfect`.`languages`VALUES (68,'Lithuanian', "LT");
        INSERT INTO `movies_perfect`.`languages`VALUES (69,'Latvian/Lettish', "LV");
        INSERT INTO `movies_perfect`.`languages`VALUES (70,'Malagasy', "MG");
        INSERT INTO `movies_perfect`.`languages`VALUES (71,'Maori', "MI");
        INSERT INTO `movies_perfect`.`languages`VALUES (72,'Macedonian', "MK");
        INSERT INTO `movies_perfect`.`languages`VALUES (73,'Malayalam', "ML");
        INSERT INTO `movies_perfect`.`languages`VALUES (74,'Mongolian', "MN");
        INSERT INTO `movies_perfect`.`languages`VALUES (75,'Moldavian', "MO");
        INSERT INTO `movies_perfect`.`languages`VALUES (76,'Marathi', "MR");
        INSERT INTO `movies_perfect`.`languages`VALUES (77,'Malay', "MS");
        INSERT INTO `movies_perfect`.`languages`VALUES (78,'Maltese', "MT");
        INSERT INTO `movies_perfect`.`languages`VALUES (79,'Burmese', "MY");
        INSERT INTO `movies_perfect`.`languages`VALUES (80,'Nauru', "NA");
        INSERT INTO `movies_perfect`.`languages`VALUES (81,'Nepali', "NE");
        INSERT INTO `movies_perfect`.`languages`VALUES (82,'Dutch', "NL");
        INSERT INTO `movies_perfect`.`languages`VALUES (83,'Norwegina', "NO");
        INSERT INTO `movies_perfect`.`languages`VALUES (84,'Occitan', "OC");
        INSERT INTO `movies_perfect`.`languages` VALUES(85, '(Afan)/Oromoor/Oriya', 'om');
        INSERT INTO `movies_perfect`.`languages` VALUES(86, 'Punjabi', 'pa');
        INSERT INTO `movies_perfect`.`languages` VALUES(87, 'Polish', 'pl');
        INSERT INTO `movies_perfect`.`languages` VALUES(88, 'Pashto/Pushto', 'ps');
        INSERT INTO `movies_perfect`.`languages` VALUES(89, 'Portuguese', 'pt');
        INSERT INTO `movies_perfect`.`languages` VALUES(90, 'Quechua', 'qu');
        INSERT INTO `movies_perfect`.`languages` VALUES(91, 'Rhaeto-Romance', 'rm');
        INSERT INTO `movies_perfect`.`languages` VALUES(92, 'Kirundi', 'rn');
        INSERT INTO `movies_perfect`.`languages` VALUES(93, 'Romanian', 'ro');
        INSERT INTO `movies_perfect`.`languages` VALUES(94, 'Russian', 'ru');
        INSERT INTO `movies_perfect`.`languages` VALUES(95, 'Kinyarwanda', 'rw');
        INSERT INTO `movies_perfect`.`languages` VALUES(96, 'Sanskrit', 'sa');
        INSERT INTO `movies_perfect`.`languages` VALUES(97, 'Sindhi', 'sd');
        INSERT INTO `movies_perfect`.`languages` VALUES(98, 'Sangro', 'sg');
        INSERT INTO `movies_perfect`.`languages` VALUES(99, 'Serbo-Croatian', 'sh');
        INSERT INTO `movies_perfect`.`languages` VALUES(100, 'Singhalese', 'si');
        INSERT INTO `movies_perfect`.`languages` VALUES(101, 'Slovak', 'sk');
        INSERT INTO `movies_perfect`.`languages` VALUES(102, 'Slovenian', 'sl');
        INSERT INTO `movies_perfect`.`languages` VALUES(103, 'Samoan', 'sm');
        INSERT INTO `movies_perfect`.`languages` VALUES(104, 'Shona', 'sn');
        INSERT INTO `movies_perfect`.`languages` VALUES(105, 'Somali', 'so');
        INSERT INTO `movies_perfect`.`languages` VALUES(106, 'Albanian', 'sq');
        INSERT INTO `movies_perfect`.`languages` VALUES(107, 'Serbian', 'sr');
        INSERT INTO `movies_perfect`.`languages` VALUES(108, 'Siswati', 'ss');
        INSERT INTO `movies_perfect`.`languages` VALUES(109, 'Sesotho', 'st');
        INSERT INTO `movies_perfect`.`languages` VALUES(110, 'Sundanese', 'su');
        INSERT INTO `movies_perfect`.`languages` VALUES(111, 'Swedish', 'sv');
        INSERT INTO `movies_perfect`.`languages` VALUES(112, 'Swahili', 'sw');
        INSERT INTO `movies_perfect`.`languages` VALUES(113, 'Tamil', 'ta');
        INSERT INTO `movies_perfect`.`languages` VALUES(114, 'Telugu', 'te');
        INSERT INTO `movies_perfect`.`languages` VALUES(115, 'Tajik', 'tg');
        INSERT INTO `movies_perfect`.`languages` VALUES(116, 'Thai', 'th');
        INSERT INTO `movies_perfect`.`languages` VALUES(117, 'Tigrinya', 'ti');
        INSERT INTO `movies_perfect`.`languages` VALUES(118, 'Turkmen', 'tk');
        INSERT INTO `movies_perfect`.`languages` VALUES(119, 'Tagalog', 'tl');
        INSERT INTO `movies_perfect`.`languages` VALUES(120, 'Setswana', 'tn');
        INSERT INTO `movies_perfect`.`languages` VALUES(121, 'Tonga', 'to');
        INSERT INTO `movies_perfect`.`languages` VALUES(122, 'Turkish', 'tr');
        INSERT INTO `movies_perfect`.`languages` VALUES(123, 'Tsonga', 'ts');
        INSERT INTO `movies_perfect`.`languages` VALUES(124, 'Tatar', 'tt');
        INSERT INTO `movies_perfect`.`languages` VALUES(125, 'Twi', 'tw');
        INSERT INTO `movies_perfect`.`languages` VALUES(126, 'Ukrainian', 'uk');
        INSERT INTO `movies_perfect`.`languages` VALUES(127, 'Urdu', 'ur');
        INSERT INTO `movies_perfect`.`languages` VALUES(128, 'Uzbek', 'uz');
        INSERT INTO `movies_perfect`.`languages` VALUES(129, 'Vietnamese', 'vi');
        INSERT INTO `movies_perfect`.`languages` VALUES(130, 'Volapuk', 'vo');
        INSERT INTO `movies_perfect`.`languages` VALUES(131, 'Wolof', 'wo');
        INSERT INTO `movies_perfect`.`languages` VALUES(132, 'Xhosa', 'xh');
        INSERT INTO `movies_perfect`.`languages` VALUES(133, 'Yoruba', 'yo');
        INSERT INTO `movies_perfect`.`languages` VALUES(134, 'Chinese', 'zh');
        INSERT INTO `movies_perfect`.`languages` VALUES(135, 'Zulu', 'zu');

        INSERT INTO `movies_perfect`.`countries` VALUES ('AF', 'Afghanistan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AL', 'Albania');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DZ', 'Algeria');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DS', 'American Samoa');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AD', 'Andorra');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AO', 'Angola');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AI', 'Anguilla');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AQ', 'Antarctica');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AG', 'Antigua and Barbuda');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AR', 'Argentina');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AM', 'Armenia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AW', 'Aruba');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AU', 'Australia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AT', 'Austria');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AZ', 'Azerbaijan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BS', 'Bahamas');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BH', 'Bahrain');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BD', 'Bangladesh');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BB', 'Barbados');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BY', 'Belarus');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BE', 'Belgium');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BZ', 'Belize');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BJ', 'Benin');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BM', 'Bermuda');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BT', 'Bhutan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BO', 'Bolivia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BA', 'Bosnia and Herzegovina');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BW', 'Botswana');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BV', 'Bouvet Island');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BR', 'Brazil');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IO', 'British Indian Ocean Territory');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BN', 'Brunei Darussalam');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BG', 'Bulgaria');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BF', 'Burkina Faso');
        INSERT INTO `movies_perfect`.`countries` VALUES ('BI', 'Burundi');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KH', 'Cambodia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CM', 'Cameroon');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CA', 'Canada');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CV', 'Cape Verde');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KY', 'Cayman Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CF', 'Central African Republic');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TD', 'Chad');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CL', 'Chile');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CN', 'China');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CX', 'Christmas Island');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CC', 'Cocos (Keeling) Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CO', 'Colombia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KM', 'Comoros');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CG', 'Congo');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CK', 'Cook Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CR', 'Costa Rica');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HR', 'Croatia (Hrvatska)');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CU', 'Cuba');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CY', 'Cyprus');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CZ', 'Czech Republic');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DK', 'Denmark');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DJ', 'Djibouti');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DM', 'Dominica');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DO', 'Dominican Republic');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TP', 'East Timor');
        INSERT INTO `movies_perfect`.`countries` VALUES ('EC', 'Ecuador');
        INSERT INTO `movies_perfect`.`countries` VALUES ('EG', 'Egypt');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SV', 'El Salvador');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GQ', 'Equatorial Guinea');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ER', 'Eritrea');
        INSERT INTO `movies_perfect`.`countries` VALUES ('EE', 'Estonia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ET', 'Ethiopia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FK', 'Falkland Islands (Malvinas)');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FO', 'Faroe Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FJ', 'Fiji');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FI', 'Finland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FR', 'France');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FX', 'France, Metropolitan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GF', 'French Guiana');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PF', 'French Polynesia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TF', 'French Southern Territories');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GA', 'Gabon');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GM', 'Gambia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GE', 'Georgia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('DE', 'Germany');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GH', 'Ghana');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GI', 'Gibraltar');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GK', 'Guernsey');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GR', 'Greece');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GL', 'Greenland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GD', 'Grenada');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GP', 'Guadeloupe');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GU', 'Guam');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GT', 'Guatemala');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GN', 'Guinea');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GW', 'Guinea-Bissau');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GY', 'Guyana');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HT', 'Haiti');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HM', 'Heard and Mc Donald Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HN', 'Honduras');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HK', 'Hong Kong');
        INSERT INTO `movies_perfect`.`countries` VALUES ('HU', 'Hungary');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IS', 'Iceland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IN', 'India');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IM', 'Isle of Man');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ID', 'Indonesia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IR', 'Iran (Islamic Republic of)');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IQ', 'Iraq');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IE', 'Ireland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IL', 'Israel');
        INSERT INTO `movies_perfect`.`countries` VALUES ('IT', 'Italy');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CI', 'Ivory Coast');
        INSERT INTO `movies_perfect`.`countries` VALUES ('JE', 'Jersey');
        INSERT INTO `movies_perfect`.`countries` VALUES ('JM', 'Jamaica');
        INSERT INTO `movies_perfect`.`countries` VALUES ('JP', 'Japan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('JO', 'Jordan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KZ', 'Kazakhstan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KE', 'Kenya');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KI', 'Kiribati');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KP', 'Korea, Democratic People''s Republic of');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KR', 'Korea, Republic of');
        INSERT INTO `movies_perfect`.`countries` VALUES ('XK', 'Kosovo');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KW', 'Kuwait');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KG', 'Kyrgyzstan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LA', 'Lao People''s Democratic Republic');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LV', 'Latvia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LB', 'Lebanon');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LS', 'Lesotho');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LR', 'Liberia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LY', 'Libyan Arab Jamahiriya');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LI', 'Liechtenstein');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LT', 'Lithuania');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LU', 'Luxembourg');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MO', 'Macau');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MK', 'Macedonia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MG', 'Madagascar');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MW', 'Malawi');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MY', 'Malaysia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MV', 'Maldives');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ML', 'Mali');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MT', 'Malta');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MH', 'Marshall Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MQ', 'Martinique');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MR', 'Mauritania');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MU', 'Mauritius');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TY', 'Mayotte');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MX', 'Mexico');
        INSERT INTO `movies_perfect`.`countries` VALUES ('FM', 'Micronesia, Federated States of');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MD', 'Moldova, Republic of');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MC', 'Monaco');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MN', 'Mongolia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ME', 'Montenegro');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MS', 'Montserrat');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MA', 'Morocco');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MZ', 'Mozambique');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MM', 'Myanmar');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NA', 'Namibia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NR', 'Nauru');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NP', 'Nepal');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NL', 'Netherlands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AN', 'Netherlands Antilles');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NC', 'New Caledonia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NZ', 'New Zealand');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NI', 'Nicaragua');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NE', 'Niger');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NG', 'Nigeria');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NU', 'Niue');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NF', 'Norfolk Island');
        INSERT INTO `movies_perfect`.`countries` VALUES ('MP', 'Northern Mariana Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('NO', 'Norway');
        INSERT INTO `movies_perfect`.`countries` VALUES ('OM', 'Oman');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PK', 'Pakistan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PW', 'Palau');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PS', 'Palestine');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PA', 'Panama');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PG', 'Papua New Guinea');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PY', 'Paraguay');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PE', 'Peru');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PH', 'Philippines');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PN', 'Pitcairn');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PL', 'Poland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PT', 'Portugal');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PR', 'Puerto Rico');
        INSERT INTO `movies_perfect`.`countries` VALUES ('QA', 'Qatar');
        INSERT INTO `movies_perfect`.`countries` VALUES ('RE', 'Reunion');
        INSERT INTO `movies_perfect`.`countries` VALUES ('RO', 'Romania');
        INSERT INTO `movies_perfect`.`countries` VALUES ('RU', 'Russian Federation');
        INSERT INTO `movies_perfect`.`countries` VALUES ('RW', 'Rwanda');
        INSERT INTO `movies_perfect`.`countries` VALUES ('KN', 'Saint Kitts and Nevis');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LC', 'Saint Lucia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VC', 'Saint Vincent and the Grenadines');
        INSERT INTO `movies_perfect`.`countries` VALUES ('WS', 'Samoa');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SM', 'San Marino');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ST', 'Sao Tome and Principe');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SA', 'Saudi Arabia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SN', 'Senegal');
        INSERT INTO `movies_perfect`.`countries` VALUES ('RS', 'Serbia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SC', 'Seychelles');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SL', 'Sierra Leone');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SG', 'Singapore');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SK', 'Slovakia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SI', 'Slovenia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SB', 'Solomon Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SO', 'Somalia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ZA', 'South Africa');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GS', 'South Georgia South Sandwich Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SS', 'South Sudan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ES', 'Spain');
        INSERT INTO `movies_perfect`.`countries` VALUES ('LK', 'Sri Lanka');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SH', 'St. Helena');
        INSERT INTO `movies_perfect`.`countries` VALUES ('PM', 'St. Pierre and Miquelon');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SD', 'Sudan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SR', 'Suriname');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SZ', 'Swaziland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SE', 'Sweden');
        INSERT INTO `movies_perfect`.`countries` VALUES ('CH', 'Switzerland');
        INSERT INTO `movies_perfect`.`countries` VALUES ('SY', 'Syrian Arab Republic');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TW', 'Taiwan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TJ', 'Tajikistan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TZ', 'Tanzania, United Republic of');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TH', 'Thailand');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TG', 'Togo');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TK', 'Tokelau');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TO', 'Tonga');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TT', 'Trinidad and Tobago');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TN', 'Tunisia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TR', 'Turkey');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TM', 'Turkmenistan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TC', 'Turks and Caicos Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('TV', 'Tuvalu');
        INSERT INTO `movies_perfect`.`countries` VALUES ('UG', 'Uganda');
        INSERT INTO `movies_perfect`.`countries` VALUES ('UA', 'Ukraine');
        INSERT INTO `movies_perfect`.`countries` VALUES ('AE', 'United Arab Emirates');
        INSERT INTO `movies_perfect`.`countries` VALUES ('GB', 'United Kingdom');
        INSERT INTO `movies_perfect`.`countries` VALUES ('US', 'United States');
        INSERT INTO `movies_perfect`.`countries` VALUES ('UM', 'United States minor outlying islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('UY', 'Uruguay');
        INSERT INTO `movies_perfect`.`countries` VALUES ('UZ', 'Uzbekistan');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VU', 'Vanuatu');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VA', 'Vatican City State');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VE', 'Venezuela');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VN', 'Vietnam');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VG', 'Virgin Islands (British)');
        INSERT INTO `movies_perfect`.`countries` VALUES ('VI', 'Virgin Islands (U.S.)');
        INSERT INTO `movies_perfect`.`countries` VALUES ('WF', 'Wallis and Futuna Islands');
        INSERT INTO `movies_perfect`.`countries` VALUES ('EH', 'Western Sahara');
        INSERT INTO `movies_perfect`.`countries` VALUES ('YE', 'Yemen');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ZR', 'Zaire');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ZM', 'Zambia');
        INSERT INTO `movies_perfect`.`countries` VALUES ('ZW', 'Zimbabwe');

        INSERT INTO `movies_perfect`.`participants` VALUES(01, 'James Stewart');
        INSERT INTO `movies_perfect`.`participants` VALUES(02, 'Deborah Kerr');
        INSERT INTO `movies_perfect`.`participants` VALUES(03, 'Peter Otoole');
        INSERT INTO `movies_perfect`.`participants` VALUES(04, 'Robert De Niro');
        INSERT INTO `movies_perfect`.`participants` VALUES(05, 'F. Murray Abraham');
        INSERT INTO `movies_perfect`.`participants` VALUES(06, 'Harrison Ford');
        INSERT INTO `movies_perfect`.`participants` VALUES(07, 'Nicole Kidman');
        INSERT INTO `movies_perfect`.`participants` VALUES(08, 'Stephen Baldwin');
        INSERT INTO `movies_perfect`.`participants` VALUES(09, 'Jack Nocholson');
        INSERT INTO `movies_perfect`.`participants` VALUES(10, 'Will Smith');
        INSERT INTO `movies_perfect`.`participants` VALUES(11, 'Johnny Depp');
        INSERT INTO `movies_perfect`.`participants` VALUES(12, 'Adam Sandler');
        INSERT INTO `movies_perfect`.`participants` VALUES(13, 'Vin Diesel');
        INSERT INTO `movies_perfect`.`participants` VALUES(14, 'Jackie Chan');
        INSERT INTO `movies_perfect`.`participants` VALUES(15, 'Morgan Freeman');
        INSERT INTO `movies_perfect`.`participants` VALUES(16, 'Angelina Jolie');
        INSERT INTO `movies_perfect`.`participants` VALUES(17, 'Robin Williams');
        INSERT INTO `movies_perfect`.`participants` VALUES(18, 'Leonardo Dicaprio');
        INSERT INTO `movies_perfect`.`participants` VALUES(19, 'Jim Carrey');
        INSERT INTO `movies_perfect`.`participants` VALUES(20, 'Nicholas Cage');
        INSERT INTO `movies_perfect`.`participants` VALUES(21, 'Bruce Willis');
        INSERT INTO `movies_perfect`.`participants` VALUES(22, 'Sandra Bullock');
        INSERT INTO `movies_perfect`.`participants` VALUES(23, 'Tom Cruise');
        INSERT INTO `movies_perfect`.`participants` VALUES(24, 'Cameron Diaz');
        INSERT INTO `movies_perfect`.`participants` VALUES(25, 'Silvestre Stallone');
        INSERT INTO `movies_perfect`.`participants` VALUES(26, 'Tom Hanks');
        INSERT INTO `movies_perfect`.`participants` VALUES(27, 'Eddie Murphy');
        INSERT INTO `movies_perfect`.`participants` VALUES(28, 'Scarlett Johansson');
        INSERT INTO `movies_perfect`.`participants` VALUES(29, 'Robert de Niro');
        INSERT INTO `movies_perfect`.`participants` VALUES(30, 'Ben Stiller');
        INSERT INTO `movies_perfect`.`participants` VALUES(31, 'Julia Roberts');
        INSERT INTO `movies_perfect`.`participants` VALUES(32, 'Owen Wilson');
        INSERT INTO `movies_perfect`.`participants` VALUES(33, 'Megan Fox');
        INSERT INTO `movies_perfect`.`participants` VALUES(34, 'Jack Black');

        INSERT INTO `movies_perfect`.`genres` VALUES(01, 'Comedy');
        INSERT INTO `movies_perfect`.`genres` VALUES(02, 'SCI-FI');
        INSERT INTO `movies_perfect`.`genres` VALUES(03, 'Horror');
        INSERT INTO `movies_perfect`.`genres` VALUES(04, 'Romance');
        INSERT INTO `movies_perfect`.`genres` VALUES(05, 'Action');
        INSERT INTO `movies_perfect`.`genres` VALUES(06, 'Thriller');
        INSERT INTO `movies_perfect`.`genres` VALUES(07, 'Drama');
        INSERT INTO `movies_perfect`.`genres` VALUES(08, 'Mystery');
        INSERT INTO `movies_perfect`.`genres` VALUES(09, 'Crime');
        INSERT INTO `movies_perfect`.`genres` VALUES(10, 'Animation');
        INSERT INTO `movies_perfect`.`genres` VALUES(11, 'Adventure');
        INSERT INTO `movies_perfect`.`genres` VALUES(12, 'Fantasy');
        INSERT INTO `movies_perfect`.`genres` VALUES(13, 'SuperHero');
        INSERT INTO `movies_perfect`.`genres` VALUES(14, 'Musical');
        INSERT INTO `movies_perfect`.`genres` VALUES(15, 'Westerns');

        INSERT INTO "roles" VALUES(01, 'Main Actor');
        INSERT INTO "roles" VALUES(02, 'Secondary Actor');

        INSERT INTO `movies_perfect`.`ratings` VALUES(01, 01,08,'Me gusto mucho la pelicula ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(02, 02,02,'la pelicula es horrible ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(03, 03,10,'es la mejor pelicula que he visto');
        INSERT INTO `movies_perfect`.`ratings` VALUES(04, 04,08,'Me gusto mucho la pelicula ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(05, 05,09,'la pelicula estuvo regular');
        INSERT INTO `movies_perfect`.`ratings` VALUES(06, 06,08,'Me gusto mucho la pelicula ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(07, 07,04,'No me gustaron los actores');
        INSERT INTO `movies_perfect`.`ratings` VALUES(08, 08,06,'no estuvo ni buena ni mala ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(09, 09,08,'Me gusto mucho la pelicula ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(10, 10,07,'pudo ser mejor  ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(11, 11,04,'no me guso casi nada ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(12, 12,06,'pudo ser mejor  ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(13, 13,05,'no me gustaron los efectos especiales  ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(14, 14,02,'no me gusto par nada ');
        INSERT INTO `movies_perfect`.`ratings` VALUES(15, 15,07,'me gusto, pero no tanto  ');
        
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(01, 07);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(02, 07);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(03, 01);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(04, 07);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(05, 05);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(06, 06);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(07, 09);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(08, 04);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(09, 07);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(10, 06);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(11, 01);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(12, 02);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(13, 04);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(14, 07);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(15, 01);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(16, 06);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(17, 03);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(18, 02);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(19, 09);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(20, 14);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(21, 15);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(22, 11);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(23, 13);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(24, 15);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(25, 12);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(26, 13);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(27, 11);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(28, 03);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(29, 09);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(30, 05);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(31, 11);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(31, 14);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(33, 13);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(34, 14);
        INSERT INTO `movies_perfect`.`genres_movies` VALUES(35, 07);

        INSERT INTO "Roles_Movies" VALUES (01, 01);
        INSERT INTO "Roles_Movies" VALUES (01, 02);
        INSERT INTO "Roles_Movies" VALUES (02, 03);
        INSERT INTO "Roles_Movies" VALUES (02, 04);
        INSERT INTO "Roles_Movies" VALUES (02, 05);
        INSERT INTO "Roles_Movies" VALUES (01, 06);
        INSERT INTO "Roles_Movies" VALUES (01, 07);
        INSERT INTO "Roles_Movies" VALUES (02, 08);
        INSERT INTO "Roles_Movies" VALUES (01, 09);
        INSERT INTO "Roles_Movies" VALUES (02, 10);
        INSERT INTO "Roles_Movies" VALUES (01, 11);
        INSERT INTO "Roles_Movies" VALUES (02, 12);
        INSERT INTO "Roles_Movies" VALUES (02, 13);
        INSERT INTO "Roles_Movies" VALUES (01, 14);
        INSERT INTO "Roles_Movies" VALUES (02, 15);
        INSERT INTO "Roles_Movies" VALUES (01, 16);
        INSERT INTO "Roles_Movies" VALUES (02, 17);
        INSERT INTO "Roles_Movies" VALUES (01, 18);
        INSERT INTO "Roles_Movies" VALUES (02, 19);
        INSERT INTO "Roles_Movies" VALUES (01, 20);
        INSERT INTO "Roles_Movies" VALUES (02, 21);
        INSERT INTO "Roles_Movies" VALUES (01, 22);
        INSERT INTO "Roles_Movies" VALUES (02, 23);
        INSERT INTO "Roles_Movies" VALUES (01, 24);
        INSERT INTO "Roles_Movies" VALUES (02, 25);
        INSERT INTO "Roles_Movies" VALUES (01, 26);
        INSERT INTO "Roles_Movies" VALUES (02, 27);
        INSERT INTO "Roles_Movies" VALUES (01, 28);
        INSERT INTO "Roles_Movies" VALUES (02, 29);
        INSERT INTO "Roles_Movies" VALUES (01, 30);
        INSERT INTO "Roles_Movies" VALUES (02, 31);
        INSERT INTO "Roles_Movies" VALUES (01, 32);
        INSERT INTO "Roles_Movies" VALUES (02, 33);
        INSERT INTO "Roles_Movies" VALUES (01, 34);
        INSERT INTO "Roles_Movies" VALUES (01, 35);

        INSERT INTO "Role_Participants" VALUES (01, 01);
        INSERT INTO "Role_Participants" VALUES (02, 02);
        INSERT INTO "Role_Participants" VALUES (01, 03);
        INSERT INTO "Role_Participants" VALUES (02, 04);
        INSERT INTO "Role_Participants" VALUES (01, 05);
        INSERT INTO "Role_Participants" VALUES (02, 06);
        INSERT INTO "Role_Participants" VALUES (01, 07);
        INSERT INTO "Role_Participants" VALUES (02, 08);
        INSERT INTO "Role_Participants" VALUES (01, 09);
        INSERT INTO "Role_Participants" VALUES (02, 10);
        INSERT INTO "Role_Participants" VALUES (01, 11);
        INSERT INTO "Role_Participants" VALUES (02, 12);
        INSERT INTO "Role_Participants" VALUES (01, 13);
        INSERT INTO "Role_Participants" VALUES (02, 14);
        INSERT INTO "Role_Participants" VALUES (01, 15);
        INSERT INTO "Role_Participants" VALUES (02, 16);
        INSERT INTO "Role_Participants" VALUES (01, 17);
        INSERT INTO "Role_Participants" VALUES (02, 18);
        INSERT INTO "Role_Participants" VALUES (01, 19);
        INSERT INTO "Role_Participants" VALUES (02, 20);
        INSERT INTO "Role_Participants" VALUES (01, 21);
        INSERT INTO "Role_Participants" VALUES (02, 22);
        INSERT INTO "Role_Participants" VALUES (01, 23);
        INSERT INTO "Role_Participants" VALUES (02, 24);
        INSERT INTO "Role_Participants" VALUES (01, 25);
        INSERT INTO "Role_Participants" VALUES (02, 26);
        INSERT INTO "Role_Participants" VALUES (01, 27);
        INSERT INTO "Role_Participants" VALUES (02, 28);
        INSERT INTO "Role_Participants" VALUES (02, 29);
        INSERT INTO "Role_Participants" VALUES (02, 30);
        INSERT INTO "Role_Participants" VALUES (01, 31);
        INSERT INTO "Role_Participants" VALUES (02, 32);
        INSERT INTO "Role_Participants" VALUES (02, 33);
        INSERT INTO "Role_Participants" VALUES (02, 34);


        INSERT INTO `movies_perfect`.`users` VALUES (1,"Ali","1988-10-13 15:59:05");
        INSERT INTO `movies_perfect`.`users` VALUES (2,"Charity","1981-10-23 11:54:01");
        INSERT INTO `movies_perfect`.`users` VALUES (3,"Upton","1992-12-21 14:41:11");
        INSERT INTO `movies_perfect`.`users` VALUES (4,"Seth","2006-12-19 10:14:07");
        INSERT INTO `movies_perfect`.`users` VALUES (5,"Haley","1985-06-07 20:44:50");
        INSERT INTO `movies_perfect`.`users` VALUES (6,"Rebekah","1995-06-10 17:29:52");
        INSERT INTO `movies_perfect`.`users` VALUES (7,"Noel","1975-11-19 05:24:55");
        INSERT INTO `movies_perfect`.`users` VALUES (8,"Cyrus","1987-01-30 04:37:46");
        INSERT INTO `movies_perfect`.`users` VALUES (9,"Xanthus","2002-03-21 05:32:05");
        INSERT INTO `movies_perfect`.`users` VALUES (10,"Hamilton","1992-12-09 20:40:19");
        INSERT INTO `movies_perfect`.`users` VALUES (11,"Curran","2003-07-27 21:43:15");
        INSERT INTO `movies_perfect`.`users` VALUES (12,"Seth","2000-06-21 20:21:02");
        INSERT INTO `movies_perfect`.`users` VALUES (13,"Chaney","1972-03-07 01:08:12");
        INSERT INTO `movies_perfect`.`users` VALUES (14,"Britanni","1975-12-03 02:24:22");
        INSERT INTO `movies_perfect`.`users` VALUES (15,"Madonna","1973-08-11 14:44:36");
        INSERT INTO `movies_perfect`.`users` VALUES (16,"Uriah","1987-09-06 03:16:40");
        INSERT INTO `movies_perfect`.`users` VALUES (17,"Nero","2010-07-14 18:50:28");
        INSERT INTO `movies_perfect`.`users` VALUES (18,"Yasir","2007-04-19 11:04:21");
        INSERT INTO `movies_perfect`.`users` VALUES (19,"Idola","2002-07-14 19:50:44");
        INSERT INTO `movies_perfect`.`users` VALUES (20,"Illiana","2003-10-17 14:50:30");
        INSERT INTO `movies_perfect`.`users` VALUES (21,"Sydnee","1992-01-03 06:03:54");
        INSERT INTO `movies_perfect`.`users` VALUES (22,"Barclay","1979-11-13 13:58:47");
        INSERT INTO `movies_perfect`.`users` VALUES (23,"Amos","1978-02-07 00:38:25");
        INSERT INTO `movies_perfect`.`users` VALUES (24,"Gabriel","1995-03-04 13:42:00");
        INSERT INTO `movies_perfect`.`users` VALUES (25,"Oren","1988-01-28 00:15:46");
        INSERT INTO `movies_perfect`.`users` VALUES (26,"Jocelyn","1993-04-13 21:53:18");
        INSERT INTO `movies_perfect`.`users` VALUES (27,"Miriam","1993-01-23 11:46:54");
        INSERT INTO `movies_perfect`.`users` VALUES (28,"Holly","1975-09-13 17:47:11");
        INSERT INTO `movies_perfect`.`users` VALUES (29,"Denise","1971-02-02 16:12:54");
        INSERT INTO `movies_perfect`.`users` VALUES (30,"Evan","2007-07-11 21:21:14");
        INSERT INTO `movies_perfect`.`users` VALUES (31,"Dolan","2001-09-01 13:30:13");
        INSERT INTO `movies_perfect`.`users` VALUES (32,"Rigel","1978-05-07 02:34:41");
        INSERT INTO `movies_perfect`.`users` VALUES (33,"Blossom","1975-08-09 04:48:04");
        INSERT INTO `movies_perfect`.`users` VALUES (34,"Minerva","1971-09-09 16:09:40");
        INSERT INTO `movies_perfect`.`users` VALUES (35,"Wade","1980-04-17 22:31:20");
        INSERT INTO `movies_perfect`.`users` VALUES (36,"Addison","1987-06-10 22:41:32");
        INSERT INTO `movies_perfect`.`users` VALUES (37,"Kylie","2008-01-26 03:19:15");
        INSERT INTO `movies_perfect`.`users` VALUES (38,"Suki","1994-03-08 23:34:05");
        INSERT INTO `movies_perfect`.`users` VALUES (39,"Slade","2003-11-06 02:47:45");
        INSERT INTO `movies_perfect`.`users` VALUES (40,"Nita","1979-06-21 14:40:32");
        INSERT INTO `movies_perfect`.`users` VALUES (41,"Neil","1975-03-03 10:48:52");
        INSERT INTO `movies_perfect`.`users` VALUES (42,"Flavia","1982-04-17 03:49:28");
        INSERT INTO `movies_perfect`.`users` VALUES (43,"Casey","2001-06-07 05:12:29");
        INSERT INTO `movies_perfect`.`users` VALUES (44,"Jocelyn","1993-05-09 12:01:28");
        INSERT INTO `movies_perfect`.`users` VALUES (45,"Emmanuel","1987-05-01 16:19:54");
        INSERT INTO `movies_perfect`.`users` VALUES (46,"Mason","2007-04-16 09:40:56");
        INSERT INTO `movies_perfect`.`users` VALUES (47,"Myles","1986-04-22 08:30:17");
        INSERT INTO `movies_perfect`.`users` VALUES (48,"Mallory","1994-06-28 03:06:15");
        INSERT INTO `movies_perfect`.`users` VALUES (49,"Brooke","2002-11-24 20:52:48");
        INSERT INTO `movies_perfect`.`users` VALUES (50,"Jennifer","1995-04-27 10:40:48");
        INSERT INTO `movies_perfect`.`users` VALUES (51,"Hyacinth","1975-09-28 05:37:14");
        INSERT INTO `movies_perfect`.`users` VALUES (52,"Addison","1993-06-06 17:41:57");
        INSERT INTO `movies_perfect`.`users` VALUES (53,"Christian","1985-11-27 05:36:43");
        INSERT INTO `movies_perfect`.`users` VALUES (54,"Paki","1973-02-05 13:33:07");
        INSERT INTO `movies_perfect`.`users` VALUES (55,"Maile","1980-12-04 07:50:37");
        INSERT INTO `movies_perfect`.`users` VALUES (56,"Farrah","2001-09-13 16:55:15");
        INSERT INTO `movies_perfect`.`users` VALUES (57,"Ronan","1979-03-10 11:56:49");
        INSERT INTO `movies_perfect`.`users` VALUES (58,"Yolanda","1996-03-06 13:35:16");
        INSERT INTO `movies_perfect`.`users` VALUES (59,"Josiah","1981-01-04 11:13:58");
        INSERT INTO `movies_perfect`.`users` VALUES (60,"Winter","1981-07-21 13:45:29");
        INSERT INTO `movies_perfect`.`users` VALUES (61,"Zelenia","1988-04-27 15:12:05");
        INSERT INTO `movies_perfect`.`users` VALUES (62,"Calvin","1994-04-24 08:16:04");
        INSERT INTO `movies_perfect`.`users` VALUES (63,"Rudyard","1996-01-04 21:02:40");
        INSERT INTO `movies_perfect`.`users` VALUES (64,"Holmes","1991-01-19 17:16:29");
        INSERT INTO `movies_perfect`.`users` VALUES (65,"Alice","1980-09-16 01:05:28");
        INSERT INTO `movies_perfect`.`users` VALUES (66,"Nathan","1975-08-16 00:51:49");
        INSERT INTO `movies_perfect`.`users` VALUES (67,"Molly","1975-02-12 22:20:06");
        INSERT INTO `movies_perfect`.`users` VALUES (68,"Jenette","1999-01-23 03:17:44");
        INSERT INTO `movies_perfect`.`users` VALUES (69,"Tiger","1991-12-18 16:43:03");
        INSERT INTO `movies_perfect`.`users` VALUES (70,"Brynne","1981-07-25 22:42:16");
        INSERT INTO `movies_perfect`.`users` VALUES (71,"Keefe","2006-04-09 01:03:17");
        INSERT INTO `movies_perfect`.`users` VALUES (72,"Neil","2000-12-15 18:28:06");
        INSERT INTO `movies_perfect`.`users` VALUES (73,"Curran","1998-02-25 06:32:43");
        INSERT INTO `movies_perfect`.`users` VALUES (74,"Hakeem","1984-01-18 21:59:48");
        INSERT INTO `movies_perfect`.`users` VALUES (75,"Rana","1981-07-26 01:33:18");
        INSERT INTO `movies_perfect`.`users` VALUES (76,"Cullen","1993-08-30 05:20:37");
        INSERT INTO `movies_perfect`.`users` VALUES (77,"Ralph","2001-08-15 23:36:55");
        INSERT INTO `movies_perfect`.`users` VALUES (78,"Harding","2004-09-04 01:49:34");
        INSERT INTO `movies_perfect`.`users` VALUES (79,"September","1991-02-03 05:03:38");
        INSERT INTO `movies_perfect`.`users` VALUES (80,"Kyle","1993-02-19 11:27:48");
        INSERT INTO `movies_perfect`.`users` VALUES (81,"Emerson","1990-07-27 16:52:19");
        INSERT INTO `movies_perfect`.`users` VALUES (82,"Lenore","1980-03-19 05:07:05");
        INSERT INTO `movies_perfect`.`users` VALUES (83,"Kyra","1980-03-27 08:26:37");
        INSERT INTO `movies_perfect`.`users` VALUES (84,"Thane","1985-06-08 03:59:41");
        INSERT INTO `movies_perfect`.`users` VALUES (85,"Gloria","1994-01-17 23:43:00");
        INSERT INTO `movies_perfect`.`users` VALUES (86,"Brenda","1994-08-01 03:46:07");
        INSERT INTO `movies_perfect`.`users` VALUES (87,"Wang","1977-12-02 16:35:02");
        INSERT INTO `movies_perfect`.`users` VALUES (88,"Ryan","1977-12-19 07:58:31");
        INSERT INTO `movies_perfect`.`users` VALUES (89,"Martena","1973-06-02 16:26:03");
        INSERT INTO `movies_perfect`.`users` VALUES (90,"Wynter","1987-12-15 20:15:41");
        INSERT INTO `movies_perfect`.`users` VALUES (91,"Roanna","2004-04-14 15:52:20");
        INSERT INTO `movies_perfect`.`users` VALUES (92,"Blossom","2010-07-05 05:42:42");
        INSERT INTO `movies_perfect`.`users` VALUES (93,"Damian","1973-08-22 20:13:24");
        INSERT INTO `movies_perfect`.`users` VALUES (94,"Mufutau","1972-08-03 11:12:40");
        INSERT INTO `movies_perfect`.`users` VALUES (95,"Colleen","1987-05-14 06:52:05");
        INSERT INTO `movies_perfect`.`users` VALUES (96,"Kevyn","1998-10-12 02:04:19");
        INSERT INTO `movies_perfect`.`users` VALUES (97,"Alexander","1985-04-21 03:46:55");
        INSERT INTO `movies_perfect`.`users` VALUES (98,"Wang","1977-11-21 17:23:11");
        INSERT INTO `movies_perfect`.`users` VALUES (99,"Macon","1986-08-05 07:30:08");
        INSERT INTO `movies_perfect`.`users` VALUES (100,"Donovan","2005-03-06 21:12:06");








        
        

        


        
          
        
    



        



