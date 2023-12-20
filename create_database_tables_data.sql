CREATE DATABASE bank;

USE bank;

CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
	account_number INT NOT NULL,
	account_holder_name VARCHAR(255) NOT NULL,
	account_holder_surname VARCHAR(255) NOT NULL,
	balance DECIMAL(10, 2) NOT NULL,
	overdraft_allowed BOOLEAN NOT NULL
);

-- Insert data
INSERT INTO accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);
