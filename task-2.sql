-- Author: Christoffer Laurits Ravn Rahbek

CREATE DATABASE jobportal_db;

GO

USE jobportal_db;

-- Create tables

CREATE TABLE job_location (
location_id INT NOT NULL IDENTITY (1,1),
postcode VARCHAR(10),
city VARCHAR(45),
PRIMARY KEY (location_id)
)

GO

CREATE TABLE job_category (
cat_id INT NOT NULL IDENTITY (1,1),
cat_name VARCHAR(45),
PRIMARY KEY (cat_id)
)

GO

CREATE TABLE job_posting (
job_id INT NOT NULL IDENTITY (1,1),
job_title VARCHAR(100),
job_description	TEXT,
date_posted DATETIME,
is_active BIT,
location_id INT,
cat_id INT,
PRIMARY KEY (job_id),
CONSTRAINT FK_postingLocation FOREIGN KEY (location_id) REFERENCES job_location (location_id),
CONSTRAINT FK_categoryPosting FOREIGN KEY (cat_id) REFERENCES job_category (cat_id)
)

GO

CREATE TABLE skill (
skill_id INT NOT NULL IDENTITY (1,1),
skill_name VARCHAR(50),
PRIMARY KEY (skill_id)
)

GO

CREATE TABLE job_requires_skill (
skill_id INT,
job_id INT,
PRIMARY KEY (skill_id,job_id)
)
GO

-- Populating tables

-- Adding locations

INSERT INTO job_location VALUES ('2900','Hellerup');
INSERT INTO job_location VALUES ('5000','Odense');

-- Adding categories

INSERT INTO job_category VALUES ('Wet work');
INSERT INTO job_category VALUES ('Number crunching');

-- Adding Posting

INSERT INTO job_posting VALUES ('Miscellaneous tasks', 'Information embraces dimensionless photons','2012-06-18 10:34:09',1,1,2);
INSERT INTO job_posting VALUES ('King of the File', 'Do I Look Like I Know What a JPEG Is?','2018-06-20 13:00:01',0,2,1);

-- Adding mad skills

INSERT INTO skill VALUES ('Impossibru');
INSERT INTO skill VALUES ('ez');

-- Specefying job skill requirements

INSERT INTO job_requires_skill VALUES (1,1);
INSERT INTO job_requires_skill VALUES (2,2);

-- Select * ad libitum