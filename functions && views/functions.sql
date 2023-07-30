create or replace function "AMOUNT_SOLD"(
    p_product_id in number
)
return number
as
p_amount_sold number;
v_sum number;
v_unit_price number;
begin
    select sum(quantity), new_price(p_product_id) into v_sum, v_unit_price from order_items o where o.product_id = p_product_id; 
    
    p_amount_sold := v_sum * v_unit_price;  
    return p_amount_sold;
end "AMOUNT_SOLD";
/



create or replace FUNCTION ENCRYPT_PASSWORD
  (   p_username in varchar2,  
      p_password  in varchar2)
return varchar2
is
  l_password varchar2(255);
  l_salt  varchar2(30) := 'RANDOM_SALT_STRING';
begin

    l_password := 
     DBMS_OBFUSCATION_TOOLKIT.MD5(
        input_string => UPPER(p_username) || l_salt || UPPER(p_password));

    return l_password;
end ENCRYPT_PASSWORD;
/


create or replace FUNCTION decrypt_password(p_password IN VARCHAR2, key_string IN VARCHAR2) RETURN VARCHAR2
AS
    l_decrypted_raw RAW(2000);
    l_decrypted     VARCHAR2(2000);
BEGIN
    l_decrypted_raw := UTL_RAW.CAST_TO_RAW(p_password);
    
    DBMS_OBFUSCATION_TOOLKIT.DES3DECRYPT(
        input_string => l_decrypted_raw,
        key_string => key_string,
        decrypted_string => l_decrypted
    );
    DBMS_OUTPUT.PUT_LINE(l_decrypted);
    RETURN l_decrypted;
END;
/


create or replace FUNCTION GET_NAME_FOR_CONV (p_sender_id IN NUMBER)
RETURN VARCHAR2
AS
    l_is_admin NUMBER;
    l_sender_name VARCHAR2(250);
BEGIN
    SELECT COUNT(*), admin_name
    INTO l_is_admin, l_sender_name
    FROM admins
    WHERE admin_id = p_sender_id;

    IF l_is_admin > 0 THEN 
        RETURN l_sender_name;
    ELSE 
        SELECT firstname || ' ' || lastname
        INTO l_sender_name
        FROM customer
        WHERE customer_id = p_sender_id;

        RETURN l_sender_name;
    END IF;
END GET_NAME_FOR_CONV;
/


create or replace function "GET_STOCK" (
    p_product_id in number )
return varchar2
as
    l_msg varchar2(255);
    v_msg number :=0;
begin
    l_msg := 'Out of Stock';
    SELECT SUM(STOCK_QUANTITY) into v_msg FROM VARIANT_STOCK E WHERE E.PRODUCT_ID = p_product_id;
    if v_msg > 0 then
        l_msg := 'In Stock';
    end if;

    return l_msg;
exception
    when no_data_found then
        apex_debug.warn(
            p_message => 'Error');
        raise;
end "GET_STOCK";
/


create or replace FUNCTION "NEW_PRICE"(
    p_product_id IN NUMBER
)
RETURN NUMBER
AS
  v_unit_price NUMBER;
  v_discount NUMBER;
  v_new_price NUMBER;
BEGIN
  SELECT unit_price, discount
  INTO v_unit_price, v_discount
  FROM product p
  WHERE p.product_id = p_product_id;

  IF v_discount > 0 THEN
    v_new_price := v_unit_price - ((v_unit_price * v_discount) / 100);
  ELSE 
    v_new_price := v_unit_price;
  END IF;

  RETURN v_new_price;
END "NEW_PRICE";
/



create or replace function "STORE_SALES"(
    p_store_id in number
)
return number
as
p_amount_sold number;
v_sum number;
v_unit_price number;
begin
    select sum(quantity), new_price(p.product_id) 
    into v_sum, v_unit_price 
    from order_items o, product p 
    where  p.store_id = p_store_id
    group by new_price(p.product_id) ; 
    
    p_amount_sold := v_sum * v_unit_price;  
    return p_amount_sold;
end "STORE_SALES";
/