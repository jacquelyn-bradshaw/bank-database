-- 1. Start a new transaction
START TRANSACTION;

-- Select account
SELECT
@moneyAvailable:=IF(balance > 0, balance, 0) AS MONEY
FROM
bank.accounts
WHERE
account_number = 111112
AND account_holder_surname = 'Smith';

-- Set transfer amount
SET @TransferAmount = 50;

-- Update account with transfer amount deducted
UPDATE accounts
SET
balance = balance - 50
WHERE
account_number = 111112
AND account_holder_surname = 'Smith';

-- Update account with transfer amount added
UPDATE accounts
SET
balance = balance + 50
WHERE
account_number = 111115
AND account_holder_surname = 'wolf';

-- View all accounts
select *
from accounts;

-- 2. (optional) Try Rollback to see how it works
ROLLBACK;

-- 3. commit changes
COMMIT;
