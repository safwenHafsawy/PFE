create or replace PACKAGE BODY "MANAGE_ORDERS" AS

    -------------------------------------------------------------
    -- CHECK IF PRODUCT EXISTS IN THE SHOPPING CART
    -------------------------------------------------------------
    FUNCTION product_exISts(p_product IN NUMBER) RETURN NUMBER IS
        l_item NUMBER;
    BEGIN
        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            SELECT ac.c002
                INTO l_item
                FROM APEX_COLLECTIONS ac
                WHERE collection_name = 'PRODUCTS'
                AND ac.c001 = p_product;

            RETURN l_item;
        ELSE
            RETURN 0;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END product_exISts;

    -------------------------------------------------------------
    -- REMOVE PRODUCT TEMPORARILY STORED IN APEX COLLECTIONS
    -------------------------------------------------------------
    PROCEDURE remove_product(p_product IN NUMBER) IS
        l_id NUMBER;
    BEGIN
        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            SELECT seq_id
                INTO l_id
                FROM APEX_COLLECTIONS ac
                WHERE collection_name = 'PRODUCTS'
                AND ac.c001 = p_product;
        END IF;
        APEX_COLLECTION.delete_member(p_collection_name => 'PRODUCTS', p_seq => l_id);
    END remove_product;

    -------------------------------------------------------------
    -- ADD PRODUCT TEMPORARILY IN APEX COLLECTIONS
    -------------------------------------------------------------
    PROCEDURE add_product(
        p_product IN NUMBER,
        p_quantity IN NUMBER,
        p_stock_id IN NUMBER,
        p_variant_1_name IN VARCHAR2,
        p_variant_2_name IN VARCHAR2,
        p_variant_3_name IN VARCHAR2
    ) IS
        l_check_exIStence NUMBER;
    BEGIN
        IF NOT apex_collection.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            apex_collection.create_collection(p_collection_name => 'PRODUCTS');
        END IF;

        l_check_exIStence := product_exISts(p_product);

        IF l_check_exIStence = 0 THEN
            apex_collection.add_member(p_collection_name => 'PRODUCTS',
                p_c001 => p_product,
                p_c002 => p_quantity,
                p_c003 => p_stock_id,
                p_c004 => p_variant_1_name,
                p_c005 => p_variant_2_name,
                p_c006 => p_variant_3_name
            );
        ELSE
            remove_product(p_product);

            apex_collection.add_member(p_collection_name => 'PRODUCTS',
                p_c001 => p_product,
                p_c002 => p_quantity,
                p_c003 => p_stock_id,
                p_c004 => p_variant_1_name,
                p_c005 => p_variant_2_name,
                p_c006 => p_variant_2_name
            );
        END IF;
    END add_product;

    -------------------------------------------------------------
    -- GET THE NUMBER OF PRODUCTS IN THE SHOPPING CART
    -------------------------------------------------------------
    FUNCTION get_quantity RETURN NUMBER IS
        l_quantity NUMBER;
    BEGIN
        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            SELECT SUM(c002)
                INTO l_quantity
                FROM APEX_COLLECTIONS ac;
        END IF;
        RETURN l_quantity;
    END get_quantity;

    -------------------------------------------------------------
    -- CLEAR THE CART
    -------------------------------------------------------------
    PROCEDURE clear_cart IS
    BEGIN
        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            APEX_COLLECTION.truncate_collection(p_collection_name => 'PRODUCTS');
        END IF;
    END clear_cart;

    -------------------------------------------------------------
    -- VALIDATE BUYER ACCOUNT
    -------------------------------------------------------------
    FUNCTION buyer_exISts(p_buyer_email IN VARCHAR2) RETURN NUMBER IS
        l_buyer_id customer.customer_id%TYPE;
    BEGIN
        SELECT customer_id
            INTO l_buyer_id
            FROM customer
            WHERE email = p_buyer_email;

        RETURN l_buyer_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END buyer_exISts;

    -------------------------------------------------------------
    -- UPDATE CUSTOMER INFORMATION
    -------------------------------------------------------------
    PROCEDURE update_customer_info(l_buyer_id IN NUMBER, p_new_address IN VARCHAR2, p_new_phone IN NUMBER, p_new_city IN NUMBER) IS
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
    -------------------------------------------------------------
    FUNCTION get_product_stock(p_product_id IN NUMBER) RETURN NUMBER IS
        l_stock_id NUMBER;
    BEGIN
        SELECT ac.c003
            INTO l_stock_id
            FROM APEX_COLLECTIONS ac
            WHERE collection_name = 'PRODUCTS'
            AND ac.c001 = p_product_id;

        RETURN l_stock_id;
    END get_product_stock;

    -------------------------------------------------------------
    -- Procedure: Update product quantity
    -------------------------------------------------------------
    PROCEDURE update_product_qty(p_product_id IN NUMBER, p_new_quantity IN NUMBER, p_new_stock IN NUMBER) IS
        l_qty NUMBER;
        l_category_id NUMBER;
        l_variant_1 VARCHAR2(1000);
        l_variant_2 VARCHAR2(1000);
        l_variant_3 VARCHAR2(1000);
    BEGIN
        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') THEN
            l_qty := product_exISts(p_product_id);

            IF l_qty > 0 THEN
                remove_product(p_product_id);
                SELECT category_id INTO l_category_id FROM product WHERE product_id = p_product_id;
                MANAGE_PRODUCTS.get_variants(l_category_id, l_variant_1, l_variant_2, l_variant_3);
                add_product(p_product_id, p_new_quantity, p_new_stock, l_variant_1, l_variant_2, l_variant_3);
            END IF;
        END IF;
    END update_product_qty;

    -------------------------------------------------------------
    -- Function: Checking Order Type
    -------------------------------------------------------------
    FUNCTION check_order_type RETURN NUMBER IS
        l_product_id NUMBER;
        l_customer_id NUMBER;
        l_prev_customer_id NUMBER;
        l_order_type NUMBER := 1;
        CURSOR pIo IS
            SELECT c001
            FROM apex_collections
            WHERE collection_name = 'PRODUCTS';
    BEGIN
        OPEN pIo;
        LOOP
            FETCH pIo INTO l_product_id;
            EXIT WHEN pIo%NOTFOUND;

            SELECT s.customer_id
                INTO l_customer_id
                FROM product p
                INNER JOIN stores s ON p.store_id = s.store_id
                WHERE product_id = l_product_id;

            IF l_prev_customer_id IS NOT NULL AND NOT l_prev_customer_id = l_customer_id THEN
                l_order_type := 2;
            END IF;

            l_prev_customer_id := l_customer_id;
        END LOOP;
        CLOSE pIo;
        RETURN l_order_type;
    END;

    -------------------------------------------------------------
    -- CREATE AND INSERT ORDER
    -------------------------------------------------------------
    PROCEDURE create_order(
        p_buyer_id IN NUMBER,
        p_address IN VARCHAR2,
        p_phone IN NUMBER,
        p_city_id IN NUMBER,
        p_payement_method IN NUMBER,
        p_delivery_type_id IN NUMBER,
        p_order_info IN orders.order_information%TYPE,
        p_order_id OUT orders.order_id%TYPE
    ) IS
        l_order_type NUMBER;
    BEGIN
        update_customer_info(p_buyer_id, p_address, p_phone, p_city_id);

        l_order_type := check_order_type;

        INSERT INTO orders (customer_id, order_type_id, order_datetime, order_status, payement_method, delivery_type_id, order_information, customer_decision)
        values (p_buyer_id, l_order_type, SYSDATE, 'Pending', p_payement_method, p_delivery_type_id, p_order_info, 'Procced')
        RETURNing order_id INTO p_order_id;

        IF APEX_COLLECTION.collection_exISts(p_collection_name => 'PRODUCTS') then
            INSERT INTO order_items (order_id, product_id, unit_price, quantity, item_status, is_new ,stock_id, last_status)
            SELECT p_order_id, p.product_id, NEW_PRICE(p.product_id) unit_price, c002, 'Pending', 'Yes' ,c003, 'Pending'
            FROM APEX_COLLECTIONS ac, product p
            WHERE collection_name = 'PRODUCTS'
            AND p.product_id = ac.c001;
        END IF;
        update_stock_quantity;
        APEX_COLLECTION.delete_collection(p_collection_name => 'PRODUCTS');
    END create_order;

    -------------------------------------------------------------
    -- update product stock after quantity
    -------------------------------------------------------------
    PROCEDURE update_stock_quantity IS
        l_product_id product.product_id%TYPE;
        l_stock_id variant_stock.stock_id%TYPE;
        l_bought_quantity number;
        cursor pIs IS
            SELECT c001, c002, c003
            FROM apex_collections
            WHERE collection_name = 'PRODUCTS';
    BEGIN
        OPEN pIs;
        LOOP
            FETCH pIs INTO l_product_id, l_bought_quantity, l_stock_id;
            EXIT WHEN pIs%notfound;

            -- update product stock after sale
            UPDATE variant_stock
            SET stock_quantity = stock_quantity - l_bought_quantity
            WHERE stock_id = l_stock_id;
        END loop;
        CLOSE pIs;
    END update_stock_quantity;

    -------------------------------------------------------------
    -- Update Customer Decision
    -------------------------------------------------------------
    PROCEDURE update_customer_decision (
        p_order_id IN NUMBER
    ) IS
        l_item_id NUMBER;
        l_item_status VARCHAR2(1000 CHAR);
        l_new_order_status VARCHAR2(1000 CHAR):= 'Confirmed'; 
        CURSOR c1 IS
            SELECT line_item_id, item_status
            FROM order_items
            WHERE order_id = p_order_id;
    BEGIN 
        OPEN c1;
        LOOP
            FETCH c1 INTO l_item_id, l_item_status;
            EXIT WHEN c1%NOTFOUND;

            IF l_item_status = 'Pending' THEN
                l_new_order_status := 'Pending';
            END IF;

            UPDATE order_items 
            SET is_replaced = 'Yes'
            WHERE line_item_id = l_item_id 
            AND item_status = 'Cancelled';

        END LOOP;
        CLOSE c1;

        UPDATE orders
        SET  
            customer_decision = 'Procced',
            order_status = l_new_order_status
        WHERE order_id = p_order_id;
    END update_customer_decision;
    -------------------------------------------------------------
    -- Update Order Item & Order Status
    -------------------------------------------------------------
    PROCEDURE update_order(
        p_new_status varchar2,
        p_line_item_id number,
        p_order_id number
    ) IS
        l_total_order_items NUMBER;
        l_pending_count NUMBER := 0;
        l_confirmed_count NUMBER := 0;
        l_cancelled_count NUMBER := 0;
        l_new_order_status VARCHAR2(100 CHAR) := 'Confirmed';
        l_new_cutomer_decision VARCHAR2(250 CHAR);
        l_is_replaced VARCHAR2(250 CHAR) := NULL;
    BEGIN 

        IF p_new_status = 'Cancelled' THEN 
            l_is_replaced := 'No';
        END IF;
        
        UPDATE order_items SET item_status = p_new_status, is_replaced = l_is_replaced WHERE line_item_id = p_line_item_id;
       
        SELECT count(*)
        INTO l_total_order_items
        FROM order_items
        WHERE order_id = p_order_id;

        FOR c1 IN (SELECT item_status, is_replaced FROM order_items WHERE order_id = p_order_id) LOOP
            IF c1.item_status = 'Pending' THEN
                l_pending_count := l_pending_count + 1;
            ELSIF c1.item_status = 'Cancelled' AND (c1.is_replaced = 'No' OR c1.is_replaced IS NOT NULL) THEN
                l_cancelled_count := l_cancelled_count + 1;
            END IF;
        END LOOP;
                apex_debug.info(p_message =>'Koen Debug 1 : '||l_pending_count);

        apex_debug.info(p_message =>'Koen Debug 1 : '||l_cancelled_count);
        IF l_cancelled_count >= 1 AND l_cancelled_count = l_total_order_items THEN
            l_new_order_status := 'Cancelled';
        ELSIF l_cancelled_count >= 1 AND l_cancelled_count < l_total_order_items THEN
            l_new_order_status := 'Partially Declined';
        ELSIF l_pending_count > 0 AND  l_cancelled_count = 0 THEN
            l_new_order_status := 'Pending';
        END IF;

        IF p_new_status = 'Cancelled' AND l_cancelled_count < l_total_order_items THEN
            l_new_cutomer_decision := 'On Hold';
        END IF;

        UPDATE orders
        SET 
            order_status = l_new_order_status, 
            customer_decision = l_new_cutomer_decision,
            mutated_items = 'Yes'
        WHERE order_id = p_order_id;

    END update_order;

    -------------------------------------------------------------
    -- check IF the customer IS the seller of the product
    -------------------------------------------------------------
    FUNCTION check_seller(
        p_product IN NUMBER,
        p_customer IN NUMBER
    ) RETURN boolean
    IS
        v_product NUMBER;
        v_store NUMBER;
        v_customer NUMBER;
    BEGIN
        SELECT p.product_id, p.store_id, s.customer_id
        INTO v_product, v_store, v_customer
        FROM product p, stores s
        WHERE p.product_id = p_product
        and p.store_id = s.store_id;
        IF v_customer = p_customer then
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END check_seller;

    -------------------------------------------------------------
    -- update product stock after quantity 
    -------------------------------------------------------------
    PROCEDURE replace_item_in_order (
        p_order_id IN NUMBER,
        p_product_id IN NUMBER,
        p_cancelled_product_id IN NUMBER,
        p_quantity IN NUMBER,
        stock_id IN NUMBER
    ) IS
        l_unit_price NUMBER;
    BEGIN
        SELECT NEW_PRICE(p_product_id) INTO l_unit_price FROM product WHERE product_id = p_product_id;

        INSERT INTO order_items (order_id, product_id, unit_price, quantity, item_status, stock_id)
        VALUES (p_order_id, p_product_id, NEW_PRICE(p_product_id), p_quantity, 'Pending', stock_id);

        UPDATE order_items SET is_replaced = 'Yes' WHERE product_id = p_cancelled_product_id;

        UPDATE orders SET order_status = 'Pending' WHERE order_id = p_order_id;

    END replace_item_in_order;

END "MANAGE_ORDERS";
/