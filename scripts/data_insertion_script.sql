/**
 * -------------- Data Insertion ----------------
 */


-- Admin Account Data Insertion

insert into admins values (admin_id_seq.nextVAL, 'pfe94053@gmail.com', 'rihab2023', 'Administrator');

-- Order Type Data Insertion 
INSERT INTO order_type VALUES (1, 'Individual');
INSERT INTO order_type VALUES (2, 'Composite');

-- states Data Insertion

-- Tunis
INSERT INTO states (state_id, state_name) VALUES (1, 'Tunis');
INSERT INTO states (state_id, state_name) VALUES (2, 'Bizerte');
INSERT INTO states (state_id, state_name) VALUES (3, 'Béja');
INSERT INTO states (state_id, state_name) VALUES (4, 'Jendouba');
INSERT INTO states (state_id, state_name) VALUES (5, 'El Kef');
INSERT INTO states (state_id, state_name) VALUES (6, 'Siliana');
INSERT INTO states (state_id, state_name) VALUES (7, 'Zaghouan');
INSERT INTO states (state_id, state_name) VALUES (8, 'Manouba');
INSERT INTO states (state_id, state_name) VALUES (9, 'Ben Arous');
INSERT INTO states (state_id, state_name) VALUES (10, 'Nabeul');
INSERT INTO states (state_id, state_name) VALUES (11, 'Sousse');
INSERT INTO states (state_id, state_name) VALUES (12, 'Monastir');
INSERT INTO states (state_id, state_name) VALUES (13, 'Mahdia');
INSERT INTO states (state_id, state_name) VALUES (14, 'Sfax');
INSERT INTO states (state_id, state_name) VALUES (15, 'Kairouan');
INSERT INTO states (state_id, state_name) VALUES (16, 'Kasserine');
INSERT INTO states (state_id, state_name) VALUES (17, 'Sidi Bouzid');
INSERT INTO states (state_id, state_name) VALUES (18, 'Gafsa');
INSERT INTO states (state_id, state_name) VALUES (19, 'Tozeur');
INSERT INTO states (state_id, state_name) VALUES (20, 'Kebili');
INSERT INTO states (state_id, state_name) VALUES (21, 'Gabès'); 
INSERT INTO states (state_id, state_name) VALUES (22, 'Medenine');
INSERT INTO states (state_id, state_name) VALUES (23, 'Tataouine');
INSERT INTO states (state_id, state_name) VALUES (24, 'Ariana');


-- Cities Data Insertion

-- Tunis
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (1, 'Tunis', '1000', 1);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (2, 'Le Bardo', '2000', 1);

-- Bizerte
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (3, 'Bizerte', '7000', 2);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (4, 'Menzel Bourguiba', '7050', 2);

-- Béja
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (5, 'Béja', '9000', 3);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (6, 'Testour', '9070', 3);

-- Jendouba
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (7, 'Jendouba', '8100', 4);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (8, 'Tabarka', '8110', 4);

-- El Kef
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (9, 'El Kef', '7100', 5);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (10, 'Dahmani', '7150', 5);

-- Siliana
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (11, 'Siliana', '6100', 6);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (12, 'Bargou', '6140', 6);

-- Zaghouan
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (13, 'Zaghouan', '1100', 7);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (14, 'Nadhour', '1120', 7);

-- Manouba
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (15, 'Manouba', '2010', 8);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (16, 'Douar Hicher', '2050', 8);

-- Ben Arous
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (17, 'Ben Arous', '2013', 9);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (18, 'Hammam Lif', '2055', 9);

-- Nabeul
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (19, 'Nabeul', '8000', 10);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (20, 'Hammamet', '8050', 10);

-- Sousse
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (21, 'Sousse', '4000', 11);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (22, 'Monastir', '5000', 11);

-- Monastir
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (23, 'Monastir', '5000', 12);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (24, 'Ksibet El Mediouni', '5040', 12);

-- Mahdia
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (25, 'Mahdia', '5100', 13);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (26, 'Chebba', '5140', 13);

-- Sfax
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (27, 'Sfax', '3000', 14);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (28, 'Sakiet Ezzit', '3040', 14);

-- Kairouan
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (29, 'Kairouan', '3100', 15);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (30, 'Oueslatia', '3130', 15);

-- Kasserine
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (31, 'Kasserine', '1200', 16);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (32, 'Sbeitla', '9170', 16);

-- Sidi Bouzid
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (33, 'Sidi Bouzid', '9100', 17);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (34, 'Menzel Bouzaiene', '9140', 17);

-- Gafsa
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (35, 'Gafsa', '2100', 18);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (36, 'Métlaoui', '2101', 18);

-- Tozeur
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (37, 'Tozeur', '2200', 19);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (38, 'Nefta', '2240', 19);

-- Kebili
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (39, 'Kebili', '4200', 20);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (40, 'Douz', '4270', 20);

-- Gabès
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (41, 'Gabès', '6000', 21);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (42, 'Mareth', '6025', 21);

-- Medenine
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (43, 'Medenine', '4100', 22);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (44, 'Beni Khedache', '4170', 22);

-- Tataouine
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (45, 'Tataouine', '3200', 23);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (46, 'Ghomrassen', '3220', 23);

-- Ariana
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (47, 'Ariana', '2080', 24);
INSERT INTO cities (city_id, city_name, zip_code, state_id) VALUES (48, 'La Soukra', '2036', 24);




-- Customer_type Table Data Insertion

insert into CUSTOMER_TYPE values (1,'Seller');
insert into CUSTOMER_TYPE values (2,'Buyer');

-- Customer Account Data Insertion

-- Customer 1
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 1, 'Ahmed', 'Ben Salah', '1234567890', 'ahmed@example.com', '123 Main Street', 1, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('ahmed@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Customer 2
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 2, 'Fatima', 'Chaabane', '9876543210', 'fatima@example.com', '456 Elm Street', 2, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('fatima@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Customer 3
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 1, 'Mohamed', 'Hammami', '1231231234', 'mohamed@example.com', '789 Oak Street', 3, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('mohamed@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Customer 4
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 2, 'Amina', 'Gharbi', '9879879876', 'amina@example.com', '321 Pine Street', 10, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('amina@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Customer 5
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 1, 'safwen', 'hafsawy', '51303002', 'saf@example.com', '321 Pine Street', 4, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('saf@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Customer 6
INSERT INTO customer (customer_id, cus_type_id, firstName, lastName, phone, email, address, city_id, password, salt)
VALUES (customer_id_seq.NEXTVAL, 1, 'rihab', 'ben ali', '54891238', 'rihab@example.com', '321 Pine Street', 16, DBMS_OBFUSCATION_TOOLKIT.MD5(input_string => UPPER('rihab@example.com') || 'VUOQOSTLHCKIPIADIZTD' || UPPER('12345')), 'VUOQOSTLHCKIPIADIZTD');

-- Categories Data Insertion

-- Category 1
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Electronics');

-- Category 2
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Fashion');

-- Category 3
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Home and Kitchen');

-- Category 4
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Health and Beauty');

-- Category 5
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Sports and Outdoors');

-- Category 6
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Books and Media');

-- Category 7
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Automotive and Tools');

-- Category 8
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Home Improvement');

-- Category 9
INSERT INTO categories (category_id, category_name)
VALUES (categ_id_seq.NEXTVAL, 'Art and Craft Supplies');

-- SubCategory Data Insertion

-- Insert SubCategory for the Electronics category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Computers and Laptops', (select category_id from categories where category_name = 'Electronics'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Mobile Phones and Tablets', (select category_id from categories where category_name = 'Electronics'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Audio and Video Equipment', (select category_id from categories where category_name = 'Electronics'));

-- Insert SubCategory for the Fashion category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Clothing and Apparel', (select category_id from categories where category_name = 'Fashion'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Shoes and Accessories', (select category_id from categories where category_name = 'Fashion'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Jewelry and Watches', (select category_id from categories where category_name = 'Fashion'));

-- Insert SubCategory for the Home and Kitchen category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Furniture and Decor', (select category_id from categories where category_name = 'Home and Kitchen'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Kitchen Appliances', (select category_id from categories where category_name = 'Home and Kitchen'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Bedding and Bath', (select category_id from categories where category_name = 'Home and Kitchen'));

-- Insert SubCategory for the Health and Beauty category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Skincare and Beauty Products', (select category_id from categories where category_name = 'Health and Beauty'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Haircare and Styling', (select category_id from categories where category_name = 'Health and Beauty'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Health and Wellness', (select category_id from categories where category_name = 'Health and Beauty'));

-- Insert SubCategory for the Sports and Outdoors category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Fitness and Exercise Equipment', (select category_id from categories where category_name = 'Sports and Outdoors'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Outdoor Recreation', (select category_id from categories where category_name = 'Sports and Outdoors'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Sports Apparel and Accessories', (select category_id from categories where category_name = 'Sports and Outdoors'));

-- Insert SubCategory for the Books and Media category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Fiction and Literature', (select category_id from categories where category_name = 'Books and Media'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Non-Fiction and Reference Books', (select category_id from categories where category_name = 'Books and Media'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Movies and TV Shows', (select category_id from categories where category_name = 'Books and Media'));

-- Insert SubCategory for the Automotive and Tools category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Auto Parts and Accessories', (select category_id from categories where category_name = 'Automotive and Tools'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Tools and Equipment', (select category_id from categories where category_name = 'Automotive and Tools'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Car Care and Maintenance', (select category_id from categories where category_name = 'Automotive and Tools'));

-- Insert SubCategory for the Home Improvement category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Power Tools', (select category_id from categories where category_name = 'Home Improvement'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Lighting and Electrical', (select category_id from categories where category_name = 'Home Improvement'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Plumbing and Fixtures', (select category_id from categories where category_name = 'Home Improvement'));

-- Insert SubCategory for the Art and Craft Supplies category 
INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Drawing and Painting', (select category_id from categories where category_name = 'Art and Craft Supplies'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Scrapbooking and Paper Crafts', (select category_id from categories where category_name = 'Art and Craft Supplies'));

INSERT INTO categories 
VALUES (categ_id_seq.NEXTVAL, 'Sewing and Fabric', (select category_id from categories where category_name = 'Art and Craft Supplies'));


-- Variants Data Insertion

-- Electronics
-- Insert variants for the Computers and Laptops 
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Computers and Laptops'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Color', (select category_id from categories where category_name = 'Computers and Laptops'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Processor', (select category_id from categories where category_name = 'Computers and Laptops'));

-- Insert variants for the Mobile Phones and Tablets
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Mobile Phones and Tablets'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Operating System', (select category_id from categories where category_name = 'Mobile Phones and Tablets'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Storage Capacity', (select category_id from categories where category_name = 'Mobile Phones and Tablets'));

-- Insert variants for the Audio and Video Equipment
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Audio and Video Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Speaker', (select category_id from categories where category_name = 'Audio and Video Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Connectivity', (select category_id from categories where category_name = 'Audio and Video Equipment'));

-- Fashion
-- Insert variants for the Clothing and Apparel
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Gender', (select category_id from categories where category_name = 'Clothing and Apparel'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Size', (select category_id from categories where category_name = 'Clothing and Apparel'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Color', (select category_id from categories where category_name = 'Clothing and Apparel'));

-- Insert variants for the Shoes and Accessories
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Shoe Type', (select category_id from categories where category_name = 'Shoes and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Shoes and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Color', (select category_id from categories where category_name = 'Shoes and Accessories'));

-- Insert variants for the Jewelry and Watches
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Material', (select category_id from categories where category_name = 'Jewelry and Watches'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Style', (select category_id from categories where category_name = 'Jewelry and Watches'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Gemstone', (select category_id from categories where category_name = 'Jewelry and Watches'));

-- Home and Kitchen
-- Insert variants for the Furniture and Decor
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Material', (select category_id from categories where category_name = 'Furniture and Decor'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Style', (select category_id from categories where category_name = 'Furniture and Decor'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Color', (select category_id from categories where category_name = 'Furniture and Decor'));

-- Insert variants for the Kitchen Appliances
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Appliance Type', (select category_id from categories where category_name = 'Kitchen Appliances'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Kitchen Appliances'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Capacity', (select category_id from categories where category_name = 'Kitchen Appliances'));

-- Insert variants for the Bedding and Bath
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Material', (select category_id from categories where category_name = 'Bedding and Bath'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Bed Size', (select category_id from categories where category_name = 'Bedding and Bath'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Color', (select category_id from categories where category_name = 'Bedding and Bath'));

-- Health and Beauty
-- Insert variants for the Skincare and Beauty Products
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Skin Type', (select category_id from categories where category_name = 'Skincare and Beauty Products'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Product Type', (select category_id from categories where category_name = 'Skincare and Beauty Products'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Ingredient', (select category_id from categories where category_name = 'Skincare and Beauty Products'));

-- Insert variants for the Haircare and Styling
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Hair Type', (select category_id from categories where category_name = 'Haircare and Styling'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Product Type', (select category_id from categories where category_name = 'Haircare and Styling'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Concern', (select category_id from categories where category_name = 'Haircare and Styling'));

-- Insert variants for the Health and Wellness
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Supplement Typ', (select category_id from categories where category_name = 'Health and Wellness'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Form', (select category_id from categories where category_name = 'Health and Wellness'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Benefit', (select category_id from categories where category_name = 'Health and Wellness'));

-- Sports and Outdoors
-- Insert variants for the Fitness and Exercise Equipment
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Equipment Type', (select category_id from categories where category_name = 'Fitness and Exercise Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Resistance Level', (select category_id from categories where category_name = 'Fitness and Exercise Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Size', (select category_id from categories where category_name = 'Fitness and Exercise Equipment'));

-- Insert variants for the Outdoor Recreation
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Activity', (select category_id from categories where category_name = 'Outdoor Recreation'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Gear Type', (select category_id from categories where category_name = 'Outdoor Recreation'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Capacity', (select category_id from categories where category_name = 'Outdoor Recreation'));

-- Insert variants for the Sports Apparel and Accessories
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Sport', (select category_id from categories where category_name = 'Sports Apparel and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Clothing Type', (select category_id from categories where category_name = 'Sports Apparel and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Size', (select category_id from categories where category_name = 'Sports Apparel and Accessories'));

-- Books and Media
-- Insert variants for the Fitness and Exercise Equipment
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Genre', (select category_id from categories where category_name = 'Fiction and Literature'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Author', (select category_id from categories where category_name = 'Fiction and Literature'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Format', (select category_id from categories where category_name = 'Fiction and Literature'));

-- Insert variants for the Non-Fiction and Reference Books
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Topic', (select category_id from categories where category_name = 'Non-Fiction and Reference Books'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Author', (select category_id from categories where category_name = 'Non-Fiction and Reference Books'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Format', (select category_id from categories where category_name = 'Non-Fiction and Reference Books'));

-- Insert variants for the Sports Apparel and Accessories
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Genre', (select category_id from categories where category_name = 'Movies and TV Shows'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Director', (select category_id from categories where category_name = 'Movies and TV Shows'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Format', (select category_id from categories where category_name = 'Movies and TV Shows'));

-- Automotive and Tools
-- Insert variants for the Auto Parts and Accessories
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Part Type', (select category_id from categories where category_name = 'Auto Parts and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Auto Parts and Accessories'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Vehicle Compatibility', (select category_id from categories where category_name = 'Auto Parts and Accessories'));

-- Insert variants for the Tools and Equipment
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Tool Type', (select category_id from categories where category_name = 'Tools and Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Tools and Equipment'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Power Source', (select category_id from categories where category_name = 'Tools and Equipment'));

-- Insert variants for the Car Care and Maintenance
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Care Product', (select category_id from categories where category_name = 'Car Care and Maintenance'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Car Care and Maintenance'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Application', (select category_id from categories where category_name = 'Car Care and Maintenance'));

-- Home Improvement
-- Insert variants for the Power Tools
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Tool Type', (select category_id from categories where category_name = 'Power Tools'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Power Tools'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Power Source', (select category_id from categories where category_name = 'Power Tools'));

-- Insert variants for the Lighting and Electrical
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Fixture Type', (select category_id from categories where category_name = 'Lighting and Electrical'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Style', (select category_id from categories where category_name = 'Lighting and Electrical'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Bulb Type', (select category_id from categories where category_name = 'Lighting and Electrical'));

-- Insert variants for the Plumbing and Fixtures
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Fixture', (select category_id from categories where category_name = 'Plumbing and Fixtures'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Style', (select category_id from categories where category_name = 'Plumbing and Fixtures'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Material', (select category_id from categories where category_name = 'Plumbing and Fixtures'));

-- Art and Craft Supplies
-- Insert variants for the Drawing and Painting
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Medium', (select category_id from categories where category_name = 'Drawing and Painting'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Brand', (select category_id from categories where category_name = 'Drawing and Painting'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Set Size', (select category_id from categories where category_name = 'Drawing and Painting'));

-- Insert variants for the Scrapbooking and Paper Crafts
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Paper Type', (select category_id from categories where category_name = 'Scrapbooking and Paper Crafts'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Theme', (select category_id from categories where category_name = 'Scrapbooking and Paper Crafts'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Embellishments', (select category_id from categories where category_name = 'Scrapbooking and Paper Crafts'));

-- Insert variants for the Sewing and Fabric
INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Fabric Type', (select category_id from categories where category_name = 'Sewing and Fabric'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Pattern', (select category_id from categories where category_name = 'Sewing and Fabric'));

INSERT INTO variants 
VALUES (variant_id_seq.NEXTVAL, 'Sewing Machine Type', (select category_id from categories where category_name = 'Sewing and Fabric'));


--insert store data 

-- Store 1 
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'Ahmed' AND lastName = 'Ben Salah'), 'FashionEmporium', 'Trendy fashion store offering the latest clothing and accessories.');

-- Store 2 
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'Mohamed' AND lastName = 'Hammami'), 'GadgetGuru', 'Your one-stop shop for all the latest gadgets and electronics.');

-- Store 3 
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'Ahmed' AND lastName = 'Ben Salah'), 'HealthHaven', 'Providing a wide range of health and wellness products for a better lifestyle.');

-- Store 4 
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'Mohamed' AND lastName = 'Hammami'), 'BookwormBoutique', 'Curated collection of books across various genres for book lovers.');

-- Store 5
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'Ahmed' AND lastName = 'Ben Salah'), 'HomeEssentials', 'Offering essential home products for a comfortable living.');

-- Store 6
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'safwen' AND lastName = 'hafsawy'), 'Old Town Jewels', 'Unveil the essence of elegance at Old Town Jewels, where exceptional craftsmanship meets timeless beauty');

-- Store 7
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'safwen' AND lastName = 'hafsawy'), 'Sport City', 'Experience the thrill of victory here, your ultimate destination for all things sports, where passion and performance collide');

-- Store 8
INSERT INTO stores (store_id, customer_id, store_name, store_description)
VALUES (store_id_seq.NEXTVAL, (SELECT customer_id FROM customer WHERE firstName = 'rihab' AND lastName = 'ben ali'), 'Toys R"us', 'Unlock a world of wonder where imagination takes flight and childhood dreams come to life with our extraordinary collection of toys');


--insert product data
/*
-- Product 1
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Wireless Headphones', 'High-quality wireless headphones with noise cancellation', 150.00, '{"Brand": "Sony", "Color": "Black", "Connectivity": "Bluetooth"}', 0, 50, 0, (SELECT category_id FROM categories WHERE category_name = 'Electronics'), (SELECT store_id FROM stores WHERE store_name = 'GadgetGuru'));

-- Product 2
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Smart TV', 'Ultra HD smart TV with built-in streaming apps', 800.00, '{"Brand": "Samsung", "Color": "Silver", "Connectivity": "Wi-Fi"}', 0, 30, 0, (SELECT category_id FROM categories WHERE category_name = 'Electronics'), (SELECT store_id FROM stores WHERE store_name = 'GadgetGuru'));

-- Product 3
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Gaming Console', 'Next-generation gaming console with immersive gameplay', 500.00, '{"Brand": "PlayStation", "Color": "Black", "Connectivity": "Ethernet"}', 0, 20, 0, (SELECT category_id FROM categories WHERE category_name = 'Electronics'), (SELECT store_id FROM stores WHERE store_name = 'GadgetGuru'));

-- Product 4
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'The Great Gatsby', 'Classic novel by F. Scott Fitzgerald', 12.99, '{"Author": "F. Scott Fitzgerald", "Genre": "Fiction", "Page Number": 180}', 0, 50, 0, (SELECT category_id FROM categories WHERE category_name = 'Books'), (SELECT store_id FROM stores WHERE store_name = 'BookwormBoutique'));

-- Product 5
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'To Kill a Mockingbird', 'Pulitzer Prize-winning novel by Harper Lee', 10.99, '{"Author": "Harper Lee", "Genre": "Fiction", "Page Number": 320}', 0, 30, 0, (SELECT category_id FROM categories WHERE category_name = 'Books'), (SELECT store_id FROM stores WHERE store_name = 'BookwormBoutique'));

-- Product 6
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, '1984', 'Dystopian novel by George Orwell', 9.99, '{"Author": "George Orwell", "Genre": "Fiction", "Page Number": 328}', 0, 20, 0, (SELECT category_id FROM categories WHERE category_name = 'Books'), (SELECT store_id FROM stores WHERE store_name = 'BookwormBoutique'));

-- Product 7
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Men T-Shirt', 'Comfortable and stylish t-shirt for men', 19.99, '{"Size": "M", "Color": "Blue", "Material": "Cotton"}', 0, 50, 0, (SELECT category_id FROM categories WHERE category_name = 'Clothing'), (SELECT store_id FROM stores WHERE store_name = 'FashionEmporium'));

-- Product 8
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Women Dress', 'Elegant and fashionable dress for women', 39.99, '{"Size": "S", "Color": "Red", "Material": "Polyester"}', 0, 30, 10, (SELECT category_id FROM categories WHERE category_name = 'Clothing'), (SELECT store_id FROM stores WHERE store_name = 'FashionEmporium'));

-- Product 9
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Unisex Hoodie', 'Warm and cozy hoodie for all genders', 29.99, '{"Size": "L", "Color": "Black", "Material": "Fleece"}', 0, 20, 2, (SELECT category_id FROM categories WHERE category_name = 'Clothing'), (SELECT store_id FROM stores WHERE store_name = 'FashionEmporium'));

-- Product 10
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Cushion Cover', 'Soft and stylish cushion cover for home decor', 9.99, '{"Material": "Cotton", "Style": "Modern", "Color": "Grey"}', 0, 100, 8, (SELECT category_id FROM categories WHERE category_name = 'Home Decor'), (SELECT store_id FROM stores WHERE store_name = 'HomeEssentials'));

-- Product 11
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Table Lamp', 'Elegant table lamp for ambient lighting', 29.99, '{"Material": "Metal", "Style": "Vintage", "Color": "Bronze"}', 0, 50, 0, (SELECT category_id FROM categories WHERE category_name = 'Home Decor'), (SELECT store_id FROM stores WHERE store_name = 'HomeEssentials'));

-- Product 12
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Elegant Diamond Ring', 'A stunning diamond ring crafted with exquisite detail, perfect for any special occasion.', 999.99, '{"Metal Type": "Gold", "Gemstone": "Diamond", "Style": "Classic"}', 10, 50, 0,  (SELECT category_id FROM categories WHERE category_name = 'Jewelry'), (SELECT store_id FROM stores WHERE store_name = 'Old Town Jewels'));

-- Product 13
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Pearl Drop Earrings', 'Delicate pearl drop earrings that add a touch of sophistication to any outfit.', 249.99, '{"Metal Type": "Silver", "Gemstone": "Pearl", "Style": "Modern"}',  5, 20, 0, (SELECT category_id FROM categories WHERE category_name = 'Jewelry'), (SELECT store_id FROM stores WHERE store_name = 'Old Town Jewels'));

-- Product 14
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Building Blocks Set', 'A creative building blocks set that sparks imagination and enhances cognitive skills.', 49.99, '{"Age Group": "3+", "Material": "Plastic", "Game Type": "Construction"}',  15, 150, 0, (SELECT category_id FROM categories WHERE category_name = 'Toys and Games'), (SELECT store_id FROM stores WHERE store_name = 'Toys R"us'));

-- Product 15
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Board Game Bundle', 'A bundle of classic board games for endless family fun.', 79.99, '{"Age Group": "6+", "Material": "Cardboard", "Game Type": "Strategy"}',  0, 10, 0, (SELECT category_id FROM categories WHERE category_name = 'Toys and Games'), (SELECT store_id FROM stores WHERE store_name = 'Toys R"us'));

-- Product 1
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Running Shoes', 'High-performance running shoes for avid runners.', 99.99, '{"Size": "8", "Color": "Black", "Sport Type": "Running"}', 0, 20, 0,  (SELECT category_id FROM categories WHERE category_name = 'Sports and Fitness'), (SELECT store_id FROM stores WHERE store_name = 'Sport City'));

-- Product 2
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Yoga Mat', 'Premium quality yoga mat for comfortable and safe practice.', 29.99, '{"Size": "Standard", "Color": "Purple", "Sport Type": "Yoga"}',  0, 35, 0, (SELECT category_id FROM categories WHERE category_name = 'Sports and Fitness'), (SELECT store_id FROM stores WHERE store_name = 'Sport City'));

-- Product 3
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Dumbbell Set', 'A set of adjustable dumbbells for strength training.', 149.99, '{"Size": "Adjustable", "Color": "Silver", "Sport Type": "Weightlifting"}',  0, 5, 0, (SELECT category_id FROM categories WHERE category_name = 'Sports and Fitness'), (SELECT store_id FROM stores WHERE store_name = 'Sport City'));

-- Product 4
INSERT INTO product (product_id, product_name, product_description, unit_price, product_variants, discount, stock, amount_sold, category_id, store_id)
VALUES (product_id_seq.NEXTVAL, 'Basketball', 'Official-size basketball for basketball enthusiasts.', 24.99, '{"Size": "Official", "Color": "Orange", "Sport Type": "Basketball"}',  10, 70, 0, (SELECT category_id FROM categories WHERE category_name = 'Sports and Fitness'), (SELECT store_id FROM stores WHERE store_name = 'Sport City'));
*/
-- delivery_type Table Data Insertion

insert into delivery_TYPE values (1,'Home Delivery', 8);
insert into delivery_TYPE values (2,'Pick up', 3);

insert into issue_topics values (issue_topic_id.NEXTVAL, 'Customer Support');
insert into issue_topics values (issue_topic_id.NEXTVAL, 'Shipping and Delivery');
insert into issue_topics values (issue_topic_id.NEXTVAL, 'Feedback');
insert into issue_topics values (issue_topic_id.NEXTVAL, 'Website Support');
insert into issue_topics values (issue_topic_id.NEXTVAL, 'Reporting Fraud or Scams');

COMMIT;
