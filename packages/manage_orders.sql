create or replace package "MANAGE_ORDERS" as

--------------------------------------------------------------
-- create procedure to add a product temporarily in apex collections
PROCEDURE add_product (
    p_product IN NUMBER,
    p_quantity IN NUMBER,
    p_stock_id IN NUMBER,
    p_variant_1_name IN VARCHAR2,
    p_variant_2_name IN VARCHAR2,
    p_variant_3_name IN VARCHAR2
);

--------------------------------------------------------------
-- create procedure to remove a product form apex collections
PROCEDURE remove_product (
  p_product IN NUMBER
);

--------------------------------------------------------------
-- create function to get the of products in the shopping cart
FUNCTION get_quantity RETURN NUMBER;

            --------------------------------------------------
    -- check if the customer is the seller of the product
    function check_seller(    
        p_product IN NUMBER,
        p_customer IN NUMBER
        ) return boolean;

--------------------------------------------------------------
-- create procedure for validate if a product exists in the shopping cart
FUNCTION product_exists(p_product IN NUMBER) RETURN NUMBER;

--------------------------------------------------------------
-- create procedure for clear the shopping cart
PROCEDURE clear_cart;

--------------------------------------------------------------
-- create function to validate customer existence
FUNCTION buyer_exists (p_buyer_email IN VARCHAR2) RETURN NUMBER;


-------------------------------------------------------------
-- UPDATE CUSTOMER INFORMATION
PROCEDURE update_customer_info(l_buyer_id in NUMBER, p_new_address in VARCHAR2, p_new_phone in NUMBER , p_new_city in NUMBER) ;

-------------------------------------------------------------
-- GET PRODUCT STOCK ID
FUNCTION get_product_stock (p_product_id in NUMBER) RETURN NUMBER;

-------------------------------------------------------------
-- UPDATE PRODUCT QUANTITY
PROCEDURE update_product_qty (p_product_id in NUMBER, p_new_quantity in NUMBER, p_new_stock IN NUMBER) ;

--------------------------------------------------------------
-- create procedure to create and insert orders

procedure create_orders(
      p_buyer_id in number,
      p_address in VARCHAR2,
      p_phone in NUMBER,
      p_city_id in NUMBER,
      p_payement_method in NUMBER,
      p_delivery_type_id in NUMBER,
      p_order_info in orders.order_information%TYPE,
      p_order_id out orders.order_id%TYPE);

--------------------------------------------------------------
-- update product stock after quntity 
procedure update_stock_quantity;

--------------------------------------------------------------
-- create procedure to create and insert orders
PROCEDURE create_order (
      p_buyer_firstName in varchar2,
      p_buyer_email in varchar2,
      p_buyer_phone in varchar2,
      p_buyer_address in varchar2,
      p_order_id out orders.order_id%TYPE,
      p_buyer_id out number
);

end "MANAGE_ORDERS";
/


create or replace package body "MANAGE_ORDERS" as

    --------------------------------------------------
    -- CHECK IF PRODUCT EXISTS IN THE SHOPPING CART
    function product_exists(p_product in number) return number is
        l_item number;
    begin
        if APEX_COLLECTION.collection_exists (p_collection_name => 'PRODUCTS') then
            select ac.c002
                into l_item
                from APEX_COLLECTIONS ac
                where collection_name = 'PRODUCTS'
                and ac.c001 = p_product;

            return l_item;
        else
            return 0;
        end if;
    exception
        when OTHERS then
            return 0;
    end product_exists;

    --------------------------------------------------
    -- REMOVE PRODUCT TEMPORARILY STORED IN APEX COLLECTIONS
    procedure remove_product(p_product in number) is
        l_id number;
    begin
        if APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') then
            select seq_id
                into l_id
                from APEX_COLLECTIONS ac
                where collection_name = 'PRODUCTS'
                and ac.c001 = p_product;
        end if;
        APEX_COLLECTION.delete_member(p_collection_name => 'PRODUCTS', p_seq => l_id);
    end remove_product;

    --------------------------------------------------
    -- ADD PRODUCT TEMPORARILY IN APEX COLLECTIONS
    PROCEDURE Add_product(    
        p_product IN NUMBER,
        p_quantity IN NUMBER,
        p_stock_id IN NUMBER,
        p_variant_1_name IN VARCHAR2,
        p_variant_2_name IN VARCHAR2,
        p_variant_3_name IN VARCHAR2
        ) 
    IS
    l_check_exsitance NUMBER;
    BEGIN
        IF NOT apex_collection.Collection_exists(p_collection_name => 'PRODUCTS') THEN
            apex_collection.Create_collection(p_collection_name => 'PRODUCTS');
        END IF;

        l_check_exsitance := Product_exists(p_product);

        IF l_check_exsitance = 0 THEN
            apex_collection.Add_member(p_collection_name => 'PRODUCTS',
                p_c001 => p_product,
                p_c002 => p_quantity,
                p_c003 => p_stock_id,
                p_c004 => p_variant_1_name, 
                p_c005 => p_variant_2_name,
                p_c006 => p_variant_3_name
                );
        ELSE
            Remove_product(p_product);

            apex_collection.Add_member(p_collection_name => 'PRODUCTS',
                p_c001 => p_product,
                p_c002 => p_quantity,
                p_c003 => p_stock_id,
                p_c004 => p_variant_1_name, 
                p_c005 => p_variant_2_name,
                p_c006 => p_variant_2_name
                );
        END IF;
    END add_product;

    --------------------------------------------------
    -- GET THE NUMBER OF PRODUCTS IN THE SHOPPING CART
    function get_quantity return number is
        l_quantity number;
    begin
        if APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') then
            select SUM(c002)
                into l_quantity
                from APEX_COLLECTIONS ac;
        end if;
        return l_quantity;
    end get_quantity;

    --------------------------------------------------
    -- CLEAR THE CART
    procedure clear_cart is
    begin
        if APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') then
            APEX_COLLECTION.truncate_collection(p_collection_name => 'PRODUCTS');
        end if;
    end clear_cart;

    --------------------------------------------------------------
    -- VALIDATE BUYER ACCOUNT
    function buyer_exists(p_buyer_email in varchar2) return number is
        l_buyer_id customer.customer_id%TYPE;
    begin
        select customer_id
            into l_buyer_id
            from customer
            where email = p_buyer_email;

        return l_buyer_id;
    exception
        when no_data_found then
            return 0;
    end buyer_exists;

    --------------------------------------------------------------
    -- UPDATE CUSTOMER INFORMATION
    PROCEDURE update_customer_info(l_buyer_id in NUMBER, p_new_address in VARCHAR2, p_new_phone in NUMBER, p_new_city in NUMBER) IS
        l_buyer_address customer.address%TYPE;
        l_buyer_phone customer.phone%TYPE;
        l_buyer_city customer.city_id%TYPE;
    BEGIN
        SELECT phone, address, city_id
            INTO l_buyer_phone, l_buyer_address, l_buyer_city
            FROM customer
            WHERE customer_id = l_buyer_id;

        UPDATE customer
            SET Address = p_new_address, city_id = p_new_city, phone = p_new_phone
            WHERE Customer_ID = l_buyer_id;
    END update_customer_info;

    -------------------------------------------------------------
    -- GET PRODUCT STOCK
    FUNCTION get_product_stock (p_product_id in NUMBER) RETURN NUMBER IS
    l_stock_id number;
    BEGIN
        select ac.c003
        into l_stock_id
        from APEX_COLLECTIONS ac
        where collection_name = 'PRODUCTS'
        and ac.c001 = p_product_id;

        return l_stock_id;
    END;

    -------------------------------------------------------------
    -- UPDATE PRODUCT QUANTITY
    PROCEDURE update_product_qty(p_product_id in NUMBER, p_new_quantity in NUMBER, p_new_stock IN NUMBER) IS
        l_qty number;
        l_category_id number;
        l_variant_1 VARCHAR2(1000);
        l_variant_2 VARCHAR2(1000);
        l_variant_3 VARCHAR2(1000);
    BEGIN
        IF APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') THEN
            l_qty := product_exists(p_product_id);

            IF l_qty > 0 THEN
                remove_product(p_product_id);
                SELECT category_id INTO l_category_id FROM product WHERE product_id = p_product_id;
                MANAGE_PRODUCTS.get_variants(l_category_id, l_variant_1, l_variant_2, l_variant_3);
                Add_product(p_product_id, p_new_quantity, p_new_stock, l_variant_1, l_variant_2, l_variant_3);
            END IF;
        END IF;
    END update_product_qty;

    ---------------------------------------------------------------
    -- CREATE AND INSERT ORDERS
    procedure create_orders(
      p_buyer_id in number,
      p_address in VARCHAR2,
      p_phone in NUMBER,
      p_city_id in NUMBER,
      p_payement_method in NUMBER,
      p_delivery_type_id in NUMBER,
      p_order_info in orders.order_information%TYPE,
      p_order_id out orders.order_id%TYPE
    ) is
    begin
        update_customer_info(p_buyer_id, p_address, p_phone, p_city_id);

        insert into orders (order_id, order_datetime, customer_id,order_status, order_information,payement_method, delivery_type_id)
        values (ORDER_ID_SEQ.nextVAL, SYSDATE,p_buyer_id ,'Pending' ,p_order_info ,p_payement_method ,p_delivery_type_id)
        returning order_id into p_order_id;

        if APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') then
            insert into order_items (order_id, line_item_id, product_id, unit_price, quantity)
            select p_order_id, seq_id, p.product_id, NEW_PRICE(p.product_id) unit_price, c002
            from APEX_COLLECTIONS ac, product p
            where collection_name = 'PRODUCTS'
            AND p.product_id = ac.c001;
        end if;
        update_stock_quantity;
        APEX_COLLECTION.delete_collection(p_collection_name => 'PRODUCTS');
    end create_orders;

    --------------------------------------------------------------
    -- update product stock after quntity 
    procedure update_stock_quantity is 
        l_product_id product.product_id%TYPE;
        l_stock_id variant_stock.stock_id%TYPE;
        l_bought_quantity number;
        cursor pIs is 
            SELECT c001,c002, c003 
            FROM apex_collections 
            WHERE collection_name = 'PRODUCTS' ; 
    begin 
        open pIs;
        loop
            fetch pIs into l_product_id, l_bought_quantity, l_stock_id;
            exit when pIs%notfound; 

            --update product stock after sale
            update variant_stock
            set stock_quantity = stock_quantity - l_bought_quantity
            where stock_id = l_stock_id;
        end loop;
        close pIs;
    end;

    --------------------------------------------------------------
    -- CREATE AND INSERT ORDER
    procedure create_order(
        p_buyer_firstName in varchar2,
        p_buyer_email in varchar2,
        p_buyer_phone in varchar2,
        p_buyer_address in varchar2,
        p_order_id out orders.order_id%TYPE,
        p_buyer_id out number
    ) is
    begin
        insert into orders (order_datetime, customer_id, order_status)
        values (SYSDATE, p_buyer_id, 'Pending')
        returning order_id into p_order_id;

        if APEX_COLLECTION.collection_exists(p_collection_name => 'PRODUCTS') then
            insert into order_items (order_id, line_item_id, product_id, quantity)
            select p_order_id, seq_id, p.product_id, c002
            from APEX_COLLECTIONS ac, product p
            where collection_name = 'PRODUCTS'
            AND p.product_id = ac.c001;
        end if;

        APEX_COLLECTION.delete_collection(p_collection_name => 'PRODUCTS');
    end create_order;

            --------------------------------------------------
    -- check if the customer is the seller of the product
    function check_seller(    
        p_product IN NUMBER,
        p_customer IN NUMBER
        ) return boolean
    IS
    v_product NUMBER;
    v_store NUMBER;
    v_customer NUMBER;
    BEGIN
        select p.product_id, p.store_id, s.customer_id 
        into v_product, v_store, v_customer
        from product p, stores s 
        where p.product_id = p_product
        and p.store_id =s.store_id;
        if v_customer = p_customer then 
            return true;
        ELSE
            return false;
        end if;
    end;

end "MANAGE_ORDERS";
/