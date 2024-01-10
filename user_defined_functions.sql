/* ----------------------------
   -- USER DEFINED FUNCTIONS --
   ----------------------------  */

/*
 Using the bank DB write a stored function that accepts
 customer account's balance as a parameter and is assessing
 whether he/she is eligible for a credit. 
- Call the function 'is_eligible' with 1 input parameter
'balace' INT
- Return a VARCHAR(20), using a declared variable called
customer_status within the function
- Use the below logic to determine eligibility:
	- balance > 100 then 'Yes'
	- balance between 50 and 100 then 'Maybe'
    - balance <50 then 'No'

Remember we need to use the below syntax structure
DELIMITER // 
CREATE FUNCTION <func_name>(param TYPE)
RETURNS <data type>
DETERMINISTIC       -- returns the same results if given the same
					input values. If the function's result can
					vary for the same input, you would omit this
                    keyword e.g when getting random numbers or
                    getting the current time stamp.
BEGIN	
	DECLARE <variable>;
	<func_logic>	

RETURN(<result>)
END //
DELIMITER ;
*/
USE bank;

DELIMITER //
CREATE FUNCTION is_eligible(balance INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE customer_status VARCHAR(20);
    IF balance > 100 THEN SET customer_status = "Yes";
    ELSEIF (balance >= 50 AND balance <= 100) THEN SET customer_status = "Maybe";
    ELSEIF balance < 50 THEN SET customer_status = "No";
    END IF;
    RETURN customer_status;
    END //
DELIMITER ;

/* Use the is_eligible function on the accounts table to show
which accounts are eligible, return their name, surname, 
balance and the result of the is_eligible function. */
SELECT account_holder_name, account_holder_surname, balance, is_eligible(balance)
FROM accounts;
