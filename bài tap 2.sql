ALTER TABLE customers
MODIFY email VARCHAR(255) NOT NULL;

ALTER TABLE customers
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE customers
ADD CONSTRAINT check_age CHECK (age >= 0);