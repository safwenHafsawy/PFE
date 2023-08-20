create or replace PACKAGE BODY "MANAGE_PRODUCTS" AS

  -- Check if product exists in the database
  FUNCTION Product_exists(p_product_id NUMBER) RETURN NUMBER IS
    l_quantity NUMBER;
  BEGIN
    SELECT COUNT(*) INTO l_quantity
    FROM product
    WHERE product_id = p_product_id;
  
    RETURN l_quantity;
  END Product_exists;

  -- Add Product
  PROCEDURE add_product(
    p_product_name       IN VARCHAR2,
    p_product_description IN VARCHAR2,
    p_unit_price         IN NUMBER,
    p_discount           IN NUMBER,
    p_category_id        IN NUMBER, 
    p_store_id           IN NUMBER,
    p_product_id         OUT NUMBER
  ) IS
  BEGIN
      INSERT INTO product (
        product_name,
        product_description,
        unit_price,
        discount,
        category_id,
        store_id
      )
      VALUES (
        p_product_name,
        p_product_description,
        p_unit_price,
        p_discount,
        p_category_id,
        p_store_id
      )
      RETURNING product_id INTO p_product_id;

  END Add_product;

  -- Update Product 
    PROCEDURE update_product(
    p_product_id          IN NUMBER,
    p_product_name        IN VARCHAR2,
    p_product_description IN VARCHAR2,
    p_unit_price          IN NUMBER,
    p_discount            IN NUMBER,
    p_category_id         IN NUMBER
  ) IS
  BEGIN
    UPDATE product 
    SET product_name = p_product_name,
        product_description = p_product_description,
        unit_price = p_unit_price,
        discount = p_discount,
        category_id = p_category_id
    WHERE product_id =  p_product_id;  

  END update_product;

  -- Add product images
  PROCEDURE Add_product_images(p_product_id IN NUMBER) IS
    CURSOR PICTURE IS
      SELECT BLOB_CONTENT, FILENAME, MIME_TYPE, CREATED_ON
      FROM apex_application_temp_files;
    l_image_blob BLOB;
    l_image_file_name VARCHAR2(4000);
    l_image_mime_type VARCHAR2(400);
    l_image_last_updated DATE;
    l_test number;
  BEGIN
    OPEN PICTURE;

    LOOP
      FETCH PICTURE INTO l_image_blob, l_image_file_name, l_image_mime_type, l_image_last_updated;
      EXIT WHEN PICTURE%NOTFOUND;

      INSERT INTO PRODUCT_IMAGES (
        product_id,
        image,
        image_mime_type,
        image_filename,
        image_last_updated
      )
      VALUES (
        p_product_id,
        l_image_blob,
        l_image_mime_type,
        l_image_file_name,
        l_image_last_updated
      );
    END LOOP;
    CLOSE PICTURE;

    DELETE apex_application_temp_files;

    SELECT COUNT(*) INTO l_test FROM apex_application_temp_files;
  END Add_product_images;

  -- Get Suitable Variants Keys For Product
  PROCEDURE Get_variants(
    p_category_id IN NUMBER,
    p_variant1_name OUT VARCHAR2,
    p_variant2_name OUT VARCHAR2,
    p_variant3_name OUT VARCHAR2
  ) IS
    TYPE VARIANT_NAME_LIST IS TABLE OF variants.variant_name%TYPE;
    l_variant_names VARIANT_NAME_LIST;
  BEGIN
    -- Retrieve variant names based on the selected category_id
    SELECT variant_name BULK COLLECT INTO l_variant_names
    FROM variants
    WHERE category_id = p_category_id;

    apex_debug.info(p_message =>'Koen Debug: '|| l_variant_names(1));
    -- Set the values for the target items
    IF l_variant_names.COUNT >= 3 THEN
      p_variant1_name := l_variant_names(1);
      p_variant2_name := l_variant_names(2);
      p_variant3_name := l_variant_names(3);
    END IF;
  END Get_variants;

  -- Get Product quantity
  PROCEDURE Get_product_quantity(p_product_id IN NUMBER, p_quantity OUT NUMBER) IS
  BEGIN
    SELECT SUM(stock_quantity) INTO p_quantity
    FROM variant_stock
    WHERE product_id = p_product_id;
  END Get_product_quantity;

  -- Get Product Full Data (For Display)
PROCEDURE Get_product_data(
    p_product_id          IN  NUMBER,
    p_product_name        OUT VARCHAR2,
    p_product_description OUT VARCHAR2,
    p_unit_price          OUT NUMBER,
    p_discount            OUT NUMBER,
    p_new_price           OUT NUMBER,
    p_category_id         OUT NUMBER,
    p_category            OUT VARCHAR2,
    p_store_id            OUT NUMBER,
    p_variant1_name       OUT VARCHAR2,
    p_variant2_name       OUT VARCHAR2,
    p_variant3_name       OUT VARCHAR2
) IS
    l_category_id NUMBER;
    l_get_variants_sql VARCHAR2(4000);
    l_test number;
  BEGIN
    -- Getting product's category
    SELECT category_id INTO l_category_id
    FROM product
    WHERE product_id = p_product_id;

    -- Getting all product data
    SELECT product_name,
           product_description,
           unit_price,
           discount,
           NEW_PRICE(p_product_id),
           p.category_id,
           c.category_name,
           p.store_id
    INTO   p_product_name,
           p_product_description,
           p_unit_price,
           p_discount,
           p_new_price,
           p_category_id,
           p_category,
           p_store_id
    FROM   product p,
           categories c
    WHERE  product_id = p_product_id
    AND    p.category_id = c.category_id;

    -- Getting variants
    -- Getting variants keys
    Get_variants(l_category_id, p_variant1_name, p_variant2_name, p_variant3_name);

  END Get_product_data;

END "MANAGE_PRODUCTS";
/