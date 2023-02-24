--------------------------------------------
--Qn 3A
SELECT DISTINCT d.ID
FROM depositor d
JOIN account a ON d.account_number = a.account_number AND d.branch_name = a.branch_name
WHERE d.ID NOT IN (
    SELECT b.ID
    FROM borrower b
    JOIN loan l ON b.loan_number = l.loan_number AND b.branch_name = l.branch_name
)

--------------------------------------------
-- Qn 3B
SELECT DISTINCT c1.ID
FROM customer c1
JOIN customer c2 ON c1.customer_street = c2.customer_street AND c1.customer_city = c2.customer_city
WHERE c2.ID = '12345' AND c1.ID <> '12345';


------------------------------------------------------
-- Qn 3C

SELECT DISTINCT b.branch_name
FROM branch b
JOIN account a ON b.branch_name = a.branch_name
JOIN depositor d ON a.account_number = d.account_number AND a.branch_name = d.branch_name
JOIN customer c ON d.ID = c.ID
WHERE c.customer_city = 'Harrison';
