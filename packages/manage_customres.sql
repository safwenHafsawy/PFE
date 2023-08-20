create or replace package body "MANAGE_CUSTOMERS" as

----------------------------------------------------------------------------
-- Procedure: Encrypt Customer Password
----------------------------------------------------------------------------
    PROCEDURE encrypt_customer_pw
    (
      p_username IN VARCHAR2,
      p_password IN VARCHAR2,
      p_encrypted_pw OUT VARCHAR2,
      p_salt OUT VARCHAR2
    )
    IS
    BEGIN
      -- Generate a random salt of 20 characters
      p_salt := DBMS_RANDOM.STRING('X', 20);

      -- Calculate the MD5 hash of the concatenated string
      p_encrypted_pw := DBMS_OBFUSCATION_TOOLKIT.MD5(
                      input_string => UPPER(p_username) || p_salt || UPPER(p_password)
                    );

    END encrypt_customer_pw;

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
        l_encrtyped_pw varchar2(1000);
        l_salt varchar2(1000);
    BEGIN
        encrypt_customer_pw(p_email,p_password, l_encrtyped_pw, l_salt);
        INSERT INTO customer (cus_type_id, firstname, lastname, phone, email, address, city_id, password, salt)
        VALUES (
            (SELECT cus_type_id FROM customer_type WHERE cus_type_name = 'Buyer'),
            p_firstname,
            p_lastname,
            p_phone,
            p_email,
            p_address,
            p_city,
            l_encrtyped_pw,
            l_salt
        );

    END create_new_account;

----------------------------------------------------------------------------
-- Procedure: Return password Authenticity
----------------------------------------------------------------------------
    FUNCTION check_pw_authenticity (
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_salt IN VARCHAR2
    )
    RETURN VARCHAR2
    IS
        l_encrypted_pw VARCHAR2(1000);
    BEGIN
        -- Calculate the MD5 hash of the concatenated string
        l_encrypted_pw := DBMS_OBFUSCATION_TOOLKIT.MD5(
                             input_string => UPPER(p_email) || p_salt || UPPER(p_password)
                          );

        -- Compare the stored password with the encrypted password
        RETURN l_encrypted_pw;
    END;



----------------------------------------------------------------------------
-- Procedure: Ftech Customer Data
----------------------------------------------------------------------------
    PROCEDURE fetch_customer_data (
        p_customer_id IN NUMBER,
        p_customer_type OUT VARCHAR2,
        p_firstname OUT VARCHAR2,
        p_lastname OUT VARCHAR2,
        p_phone OUT VARCHAR2,
        p_email OUT VARCHAR2,
        p_address OUT VARCHAR2,
        p_city OUT NUMBER,
        p_state OUT NUMBER
    ) IS
     BEGIN
        SELECT 
            firstname,
            lastname,
            phone,
            email,
            address,
            c.city_id,
            ct.state_id,
            cust.cus_type_name
        INTO 
            p_firstname,
            p_lastname,
            p_phone,
            p_email,
            p_address,
            p_city,
            p_state,
            p_customer_type
        FROM customer c
        LEFT JOIN cities ct ON c.city_id = ct.city_id
        LEFT JOIN customer_type cust ON c.cus_type_id = cust.cus_type_id 
        WHERE customer_id = p_customer_id;

        apex_debug.info(p_message =>'Koen Debug: '||p_city);
    END fetch_customer_data;

----------------------------------------------------------------------------
-- Procedure: Update Customer Data
----------------------------------------------------------------------------
    PROCEDURE update_customer_general_info(
        p_customer_id IN NUMBER,
        p_firstname IN VARCHAR2,
        p_lastname IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_email IN VARCHAR2,
        p_address IN VARCHAR2,
        p_city IN NUMBER
    ) IS
    BEGIN
        UPDATE customer
        SET firstname = p_firstname,
            lastname = p_lastname,
            phone = p_phone,
            email = p_email,
            address = p_address,
            city_id = p_city
        WHERE customer_id = p_customer_id;
    END update_customer_general_info;


----------------------------------------------------------------------------
-- Procedure: Update Customer Password
----------------------------------------------------------------------------

    PROCEDURE update_pw (
        p_customer_id IN VARCHAR2,
        p_new_password IN VARCHAR2
    ) IS
        l_encrypted_new_pw varchar2(1000);
        l_new_salt varchar2(1000);
        l_username varchar2(1000);
    BEGIN
        SELECT email 
        INTO l_username
        FROM customer
        WHERE customer_id = p_customer_id;
        
        encrypt_customer_pw( l_username, p_new_password, l_encrypted_new_pw, l_new_salt );

        UPDATE customer
        SET password = l_encrypted_new_pw,
            salt = l_new_salt
        WHERE customer_id = p_customer_id;
    END;

end "MANAGE_CUSTOMERS";
/