create or replace package "ADD_TO_WISHLIST" as

--------------------------------------------------------------
-- CHECK IF PRODUCT EXISTS IN WISHLIST TABLE
FUNCTION check_existance(
   p_product IN NUMBER,
   p_customer in NUMBER
   ) 
 RETURN NUMBER;


    --------------------------------------------------------------
-- REMOVE PRODUCT STORED IN WISHLIST TABLE

PROCEDURE remove_product (
  p_product IN NUMBER,
  p_customer in NUMBER
);


--------------------------------------------------------------
-- ADD PRODUCT IN WISHLIST TABLE

PROCEDURE add_product (
    p_product IN NUMBER,
    p_customer in NUMBER
);


end "ADD_TO_WISHLIST";
/


create or replace package body "ADD_TO_WISHLIST" as

    --------------------------------------------------
    -- CHECK IF PRODUCT EXISTS IN WISHLIST TABLE
    function check_existance(p_product in number, p_customer in number) return number is
        l_item number  ;
    begin
         select w.product_id
             into l_item
             from wishlist w
             where w.product_id = p_product
             and w.customer_id = p_customer;
         return l_item;

        exception
        when OTHERS then
            return 0;
     
    end check_existance;

    --------------------------------------------------
    -- REMOVE PRODUCT STORED IN WISHLIST TABLE

    procedure remove_product(p_product in number, p_customer in number) is
        l_check_exsitance NUMBER;
    begin
        l_check_exsitance := check_existance(p_product, p_customer);
        if l_check_exsitance > 0 then
            DELETE 
            FROM wishlist 
            WHERE product_id = p_product
            and customer_id = p_customer;
        end if;
        
    end remove_product;

    --------------------------------------------------
    -- ADD PRODUCT IN WISHLIST TABLE

    PROCEDURE Add_product(p_product IN NUMBER, p_customer in number) IS
        l_check_exsitance NUMBER;
    BEGIN

        l_check_exsitance := check_existance(p_product, p_customer);
        
            IF l_check_exsitance = 0 THEN
                INSERT INTO wishlist (wishlist_id, product_id, customer_id)
                VALUES (wishlist_id_seq.nextval, p_product, p_customer); 
            ELSE
                Remove_product(p_product, p_customer);

                INSERT INTO wishlist (wishlist_id, product_id, customer_id)
                VALUES (wishlist_id_seq.nextval, p_product, p_customer); 
            
        end if;
    END add_product;

end "ADD_TO_WISHLIST";
/