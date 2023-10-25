-- Drop all tables --

DROP TABLE IF EXISTS authorship;
DROP TABLE IF EXISTS paper;
DROP TABLE IF EXISTS researcher;


-- Create all tables --

CREATE TABLE researcher (
	researcher_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	surname VARCHAR(255),
	forenames VARCHAR(255),
	affiliation VARCHAR(255),
	orc_id VARCHAR(20),
	PRIMARY KEY (researcher_id)
);

CREATE TABLE paper (
	paper_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	paper_title VARCHAR(255),
	pub_year INTEGER,
	paper_type CHAR(1),
	doi VARCHAR(120),
	outlet_name VARCHAR(255),
	citations INTEGER,
	PRIMARY KEY (paper_id),
	UNIQUE KEY doi (doi)
);

CREATE TABLE authorship (
	authorship_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	paper_id INTEGER UNSIGNED NOT NULL,
	researcher_id INTEGER UNSIGNED NOT NULL,
	seqno INTEGER,
	PRIMARY KEY (authorship_id),
	FOREIGN KEY (paper_id) REFERENCES paper (paper_id),
	FOREIGN KEY (researcher_id) REFERENCES researcher (researcher_id)
);


-- Populate data --

INSERT INTO researcher (researcher_id, surname, forenames, affiliation, orc_id)
VALUES
	(1,'Conboy','Kieran','Lero / University of Galway',NULL),
	(2,'Babu','Jaganath','University of Galway',NULL),
	(3,'Dennehy','Denis','University of Galway',NULL),
	(4,'Umair','Azka','University of Galway',NULL),
	(5,'Whelan','Eoin','University of Galway',NULL),
	(6,'Carroll','Noel','University of Galway','0000-0001-8344-1220'),
	(7,'Wang','Xiaofeng','Free University of Bozen-Bolzano',NULL),
	(8,'Fitzgerald','Brian','Lero / University of Limerick',NULL),
	(9,'Hartnett','Gerard','Intel Communications Europe',NULL),
	(10,'Zamani','Efpraxia D.','Durham University','0000-0003-3110-7495'),
	(11,'Griva','Anastasia','Lero / University of Galway',NULL),
	(12,'Wang','Blair','Lero / University of Galway','0000-0002-2194-5623'),
	(13,'Schlagwein','Daniel','University of Sydney','0000-0002-1591-4660'),
	(14,'Cecez-Kecmanovic','Dubravka','University of New South Wales','0000-0001-8028-3896'),
	(15,'Cahalane','Michael C.','University of New South Wales','0000-0002-4301-378X'),
	(16,'Bardaki','Cleopatra',NULL,NULL),
	(17,'Pramatari','Katerina',NULL,NULL),
	(18,'Papakiriakopoulos','Dimitris',NULL,NULL),
	(19,'Acton','Tom','University of Galway',NULL),
	(20,'Datta','Pratim Milton','Kent State University / University of Johannesburg','0000-0001-7371-4627');


INSERT INTO paper (paper_id, paper_title, pub_year, paper_type, doi, outlet_name, citations)
VALUES
	(1,'Adopting Learning Analytics to Inform Postgraduate Curriculum Design: Recommendations and Research Agenda',2023,'J','10.1007/s10796-021-10183-z','Information Systems Frontiers',5),
	(2,'Examining technostress and its impact on worker well-being in the digital gig economy',2023,'J','10.1108/INTR-03-2022-0214','Internet Research',0),
	(3,'From transformation to normalisation: An exploratory study of a large-scale agile transformation',2023,'J','10.1177/02683962231164428','Journal of Information Technology',6),
	(4,'Agility from First Principles: Reconstructing the Concept of Agility in Information Systems Development',2009,'J','10.1287/isre.1090.0236','Information Systems Research',1215),
	(5,'Customising agile methods to software practices at Intel Shannon',2006,'J','10.1057/palgrave.ejis.3000605','European Journal of Information Systems',578),
	(6,'Using Business Analytics for SME Business Model Transformation under Pandemic Time Pressure',2022,'J','10.1007/s10796-022-10255-8','Information Systems Frontiers',21),
	(7,'Beyond the Factory Paradigm: Digital Nomadism and the Digital Future(s) of Knowledge Work Post-COVID-19',2020,'J','10.17705/1jais.00641','Journal of the Association for Information Systems',100),
	(8,'Retail business analytics: Customer visit segmentation using market basket data',2018,'J','10.1016/j.eswa.2018.01.029','Expert Systems with Applications',154),
	(9,'From disruption to ransomware: Lessons From hackers',2022,'J','10.1177/20438869221110246','Journal of Information Technology Teaching Cases',8);

INSERT INTO authorship (authorship_id, paper_id, researcher_id, seqno)
VALUES
	(1,1,3,1),
	(2,1,1,2),
	(3,1,2,3),
	(4,2,4,1),
	(5,2,1,2),
	(6,2,5,3),
	(7,3,1,2),
	(8,3,6,1),
	(9,3,7,3),
	(10,4,1,1),
	(11,5,8,1),
	(12,5,9,2),
	(13,5,1,3),
	(14,6,10,1),
	(15,6,11,2),
	(16,6,1,3),
	(17,7,12,1),
	(18,7,13,2),
	(19,7,14,3),
	(20,7,15,4),
	(21,8,11,1),
	(22,8,16,2),
	(23,8,17,3),
	(24,8,18,4),
	(25,9,20,1),
	(26,9,19,2);


