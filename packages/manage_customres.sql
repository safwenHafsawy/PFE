create or replace package "MANAGE_CUSTOMERS" as

----------------------------------------------------------------------------
-- Procedure: Create New Customer Account
----------------------------------------------------------------------------
    PROCEDURE create_new_account (
        p_firstname IN VARCHAR2,
        p_lastname IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_email IN VARCHAR2,
        p_address IN VARCHAR2,
        p_city IN NUMBER,
        p_password IN VARCHAR2
    );

end "MANAGE_CUSTOMERS";
/


create or replace package body "MANAGE_CUSTOMERS" as

----------------------------------------------------------------------------
-- Procedure: Create New Customer Account
----------------------------------------------------------------------------
    PROCEDURE create_new_account (
        p_firstname IN VARCHAR2,
        p_lastname IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_email IN VARCHAR2,
        p_address IN VARCHAR2,
        p_city IN NUMBER,
        p_password IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO customer 
        VALUES (
            customer_id_seq.NEXTVAL,
            (SELECT cus_type_id FROM customer_type WHERE cus_type_name = 'Buyer'),
            p_firstname,
            p_lastname,
            p_phone,
            p_email,
            p_address,
            p_city,
            ENCRYPT_PASSWORD(p_firstname,p_password)
        );

    END;

end "MANAGE_CUSTOMERS";
/