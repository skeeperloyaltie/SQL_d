----------------------------------------------
-- Qn 4A
CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100)
);

CREATE TABLE course (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50)
);

CREATE TABLE section (
  id INT PRIMARY KEY,
  semester VARCHAR(20),
  year INT,
  course_id INT,
  instructor VARCHAR(50),
  FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE exam (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE marks (
  id INT,
  section_id INT,
  exam_id INT,
  marks INT,
  FOREIGN KEY (id) REFERENCES student(id),
  FOREIGN KEY (section_id) REFERENCES section(id),
  FOREIGN KEY (exam_id) REFERENCES exam(id),
  PRIMARY KEY (id, section_id, exam_id)
);

-- -----------------------------------------
-- Qn 4B
CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100)
);
CREATE TABLE course (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50)
);

CREATE TABLE section (
  id INT PRIMARY KEY,
  semester VARCHAR(20),
  year INT,
  course_id INT,
  instructor VARCHAR(50),
  FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE enrollment (
  id INT,
  section_id INT,
  PRIMARY KEY (id, section_id),
  FOREIGN KEY (id) REFERENCES student(id),
  FOREIGN KEY (section_id) REFERENCES section(id)
);

CREATE TABLE exam (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE marks (
  id INT,
  section_id INT,
  exam_id INT,
  marks INT,
  FOREIGN KEY (id, section_id) REFERENCES enrollment(id, section_id),
  FOREIGN KEY (exam_id) REFERENCES exam(id),
  PRIMARY KEY (id, section_id, exam_id)
);
