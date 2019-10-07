DROP TABLE witches;
DROP TABLE familiars;

CREATE TABLE witches
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE familiars
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  admission_date VARCHAR(255),
  adoptable BOOLEAN,
  owner_id INT8 REFERENCES witches(id) ON DELETE CASCADE
);
