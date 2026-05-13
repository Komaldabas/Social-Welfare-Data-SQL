CREATE TABLE  IF NOT EXISTS schemes1(
  scheme_id SERIAL PRIMARY KEY,
  scheme_name VARCHAR (100), 
  category VARCHAR (50),
  benefit_amount INT
);
SELECT * FROM schemes1;

CREATE TABLE  IF NOT EXISTS citizens1(
citizen_id INT PRIMARY KEY,
name VARCHAR (100),
age INT,
income INT,
state VARCHAR(50)

);


CREATE TABLE  IF NOT EXISTS eligibility1(
eligibility_id INT PRIMARY KEY,
scheme_id INT,
min_income INT,
max_income INT,
age_limit INT,
FOREIGN KEY (scheme_id)REFERENCES schemes(scheme_id)
);

SELECT * FROM eligibility

CREATE TABLE IF NOT EXISTS applications2(
app_id INT PRIMARY KEY,
citizen_id INT,
scheme_id INT,
status VARCHAR(20),
FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id),
FOREIGN KEY (scheme_id) REFERENCES schemes (scheme_id)
);

CREATE TABLE IF NOT EXISTS benefits1(
benefit_id INT PRIMARY KEY,
app_id INT REFERENCES applications2(app_id),
amount_given INT,
date DATE
  );
  TRUNCATE TABLE benefits1;
DROP TABLE benefits1;
-- insert values

INSERT INTO   schemes1( scheme_id, scheme_name, category,benefit_amount)
--old schemes
VALUES (1, 'PM Kisan Samman Nidhi', 'Agriculture',6000),
      (2, 'Ayushman Bharat','Health', 500000),
	  (3, 'Pradhan Mantri Ujjwala yojana', 'women',1600),
	  (4, 'PM Awas yojana', 'Housing', 120000),
	  (5, 'Skill India Mission','Employment', 10000),

	  -- new schemes
	  (6, 'PM Vishwakarma yojana', 'Skill',15000),
	  (7, 'PM Surya Ghar Muft Bijli yojana', 'Energy', 78000),
	  (8, 'Janjatiyan Unnat Gram Abhiyan', 'Tribal', 50000),
	  (9, ' Vatsalya Scheme', 'Child Welfare', 200000),
	  (10, 'Electric Mobility Promotion Scheme','Transport',100000);


	   -- citizens insert (dummy)

	   INSERT INTO citizens1( citizen_id, name, age, income, state)
	   VALUES 
	   (1011, 'Ramesh kumar', 45 , 120000,'Haryana'),
	   ( 1022, 'Sunita Devi', 38, 80000, 'Punjab'),
	   (1033, 'Amit Sharma', 29,2500000, 'Delhi'),
	   (1044, 'Pooja Singh', 34, 90000, 'UP'),
	   (1055, 'Rajesh verma', 50, 150000 ,'Rajasthan'),
	   (1066, ' Neha Gupta', 27, 180000, 'Delhi '),
	   (1077, 'Suresh', 41, 110000, 'Bihar'),
	   (1088, 'Kavita', 36, 95000,' Haryana');

	   SELECT * FROM citizens1
	   
	   SELECT * FROM schemes1

INSERT INTO eligibility1 VALUES
(1,1,0 ,200000, 18),
(2 ,2,0,500000,18),
(3, 3, 0 ,150000, 18),
(4, 4, 0, 300000,21),
(5,5,0, 400000,18),
(6,6,0, 300000, 18),
(7,7,0, 200000, 18),
(8,8,0, 250000,18),
(9,9,0 ,200000, 18),
(10, 10 ,0,500000,18);

DROP TABLE schemes CASCADE;
 
INSERT INTO applications2 VALUES
(1, 1011, 1, 'Approved'),
(2, 1022,3, 'Approved'),
(3, 1033,2,'Pending'),
(4, 1044, 4,'Rejected'),
(5, 1055, 1, 'Approved'),
(6, 1066, 6,'Approves'),
(7, 1077,7,'Pending'),
(8, 1088, 5, 'Approved'),
(9, 1011, 2 ,'Approved'),
(10, 1022, 10, 'Rejected');

 DROP TABLE citizens CASCADE;

TRUNCATE TABLE applications CASCADE;
TRUNCATE TABLE citizens CASCADE;TRUNCATE TABLE eligibility CASCADE;
TRUNCATE TABLE schemes1 CASCADE;


SELECT * FROM applications2;
TRUNCATE TABLE applications CASCADE;

 INSERT INTO benefits1 VALUES
  (1,1, 6000, '2024-01-10'),
 (2,2,1600, '2024-03-15'),
 (3, 5, 6000, '2024-03-01'),
 (4 , 6, 15000, '2024-03-10'),
 (5, 8, 10000,'2024-04-01'),
 (6,9,500000, '2024-04-10');

 TRUNCATE TABLE applications CASCADE;
TRUNCATE  TABLE benefits CASCADE;
TRUNCATE TABLE benefits1 CASCADE;
SELECT * FROM applications2

SELECT *FROM benefits1;


--top schemes

SELECT s.scheme_name,COUNT (A.APP_ID)AS total
FROM schemes1 s
JOIN applications2 a ON s.scheme_id=a.scheme_id
GROUP BY s.scheme_name
ORDER BY total DESC;

