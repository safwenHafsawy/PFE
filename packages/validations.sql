create or replace package "VALIDATIONS" as

FUNCTION validate_email(
    p_email IN VARCHAR2
) RETURN BOOLEAN;

procedure validate_name(
    p_name IN varchar2,
    p_is_valid out boolean
);

procedure validate_phone(
    p_phone IN varchar2,
    p_is_valid out boolean
);

function confirm_password(
    p_confirm_password in varchar2,
    p_password in varchar2
)
return boolean;

FUNCTION validate_discount (p_discount IN NUMBER) RETURN BOOLEAN;

end "VALIDATIONS";
/


create or replace package body "VALIDATIONS" as

FUNCTION validate_email(
    p_email IN VARCHAR2
) RETURN BOOLEAN IS
    l_is_valid BOOLEAN := FALSE;
BEGIN
    IF regexp_like(p_email, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') THEN
        l_is_valid := TRUE ;
    END IF;

    RETURN l_is_valid;
END validate_email;

procedure validate_name(
    p_name IN varchar2,
    p_is_valid out boolean
)
Is 
BEGIN
    p_is_valid := FALSE;
    if p_name is null then 
        return;
    end if;

    IF REGEXP_LIKE(p_name, '^[a-zA-Z\s]+$') THEN
        p_is_valid := TRUE;
    end if;
end validate_name;

procedure validate_phone(
    p_phone IN varchar2,
    p_is_valid out boolean
)
is 
begin
    p_is_valid := false;
    if p_phone is null then 
        return;
    end if;
    if regexp_like(p_phone,'^[0-9+\s]+$')then
        p_is_valid := true;
    end if;
end validate_phone;

function confirm_password(
    p_confirm_password in varchar2,
    p_password in varchar2
)
return boolean
is 
begin 
    if p_password = p_confirm_password then 
        return true ;
    else
        return false ; 
    end if;
end confirm_password;


FUNCTION validate_discount (p_discount IN NUMBER) RETURN BOOLEAN 
IS
BEGIN
    RETURN p_discount BETWEEN 0 AND 80;
END;

end "VALIDATIONS";
/