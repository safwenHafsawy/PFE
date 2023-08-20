create or replace PACKAGE BODY VALIDATIONS AS

    -- Function to validate if the given email is in a valid format
    FUNCTION validate_email(p_email IN VARCHAR2) RETURN VARCHAR2 IS
        l_email_exists number;
        l_error_messge varchar2(250 char);
    BEGIN

        -- Check email existance
        SELECT COUNT(email)
        INTO l_email_exists
        FROM customer
        WHERE email = p_email;

        IF NOT regexp_like(p_email, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') THEN
            l_error_messge := 'Invalid Email !';
        ELSIF l_email_exists > 0 THEN 
            l_error_messge := 'Email Already Exists !';
        END IF;

        RETURN l_error_messge;
    END validate_email;

    -- Procedure to validate if the given name is valid
    PROCEDURE validate_name(p_name IN VARCHAR2, p_is_valid OUT BOOLEAN) IS
    BEGIN
        p_is_valid := FALSE;
        IF p_name IS NULL THEN 
            RETURN;
        END IF;

        IF REGEXP_LIKE(p_name, '^[a-zA-Z\s]+$') THEN
            p_is_valid := TRUE;
        END IF;
    END validate_name;

    -- Function to validate if the given phone number is valid
    FUNCTION validate_phone(p_phone IN VARCHAR2) RETURN VARCHAR2 IS
        l_phone_exists number;
        l_error_messge varchar2(250 char);
    BEGIN

        -- Check phone number existance
        SELECT COUNT(phone)
        INTO l_phone_exists
        FROM customer
        WHERE  phone = p_phone;

        IF NOT regexp_like(p_phone, '^[0-9+\s]+$') THEN
            l_error_messge := 'Invalid Phone Number !';
        ELSIF l_phone_exists > 0 THEN 
            l_error_messge := 'Phone Number Already Exists !';
        END IF;

        RETURN l_error_messge;
    END validate_phone;

    -- Function to confirm if the provided password matches the confirmed password
    FUNCTION confirm_password(p_confirm_password IN VARCHAR2, p_password IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN 
        IF p_password = p_confirm_password THEN 
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END confirm_password;

    -- Function to validate if the given discount value is valid
    FUNCTION validate_discount(p_discount IN NUMBER) RETURN BOOLEAN IS
    BEGIN
        RETURN p_discount BETWEEN 0 AND 80;
    END;

    -- Function to validate if passwords are identical
    FUNCTION validate_pw (p_customer_id IN NUMBER ,p_password IN VARCHAR2) RETURN BOOLEAN IS
        l_salt customer.salt%TYPE;
        l_stored_pw customer.password%TYPE;
        l_email customer.email%TYPE;
        l_generated_pw VARCHAR2(1000);
    BEGIN
        SELECT email,password,  salt
        INTO l_email, l_stored_pw,l_salt
        FROM customer
        WHERE customer_id = p_customer_id;
       
        l_generated_pw := MANAGE_CUSTOMERS.check_pw_authenticity (l_email, p_password, l_salt);

        IF l_generated_pw = l_stored_pw THEN
           RETURN TRUE;
        END IF;
        RETURN FALSE;
    END;

END VALIDATIONS;
/