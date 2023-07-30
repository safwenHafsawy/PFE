/**
 * -------------- Sequences Creation ----------------
 */

CREATE SEQUENCE admin_id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10
    NOCACHE;

create sequence customer_id_seq
    start with 20
    increment by 1
    NOCACHE;

create sequence store_id_seq
    start with 1
    increment by 10
    NOCACHE;

create sequence categ_id_seq
    start with 1
    increment by 1
    NOCACHE;

create sequence sub_categ_id_seq
   start with 1
   increment by 1
   NOCACHE;

create sequence variant_id_seq
    start with 1
    increment by 1;

create sequence product_id_seq
    start with 1
    increment by 5;

create sequence customer_activity_id_seq
    start with 1
    increment by 5;


create sequence order_id_seq
    start with 1
    increment by 2;

create sequence line_item_id_seq
    start with 1
    increment by 2;

create sequence review_id_seq
    start with 1
    increment by 2;

create sequence stock_variant_id
    start with 1
    increment by 4;

create sequence image_id
    start with 1
    increment by 1;

create sequence wishlist_id_seq
    start with 1
    increment by 1;

create sequence conv_id
    start with 1
    increment by 1;

create sequence message_id
    start with 1
    increment by 1;

create sequence issue_records_id
    start with 1
    increment by 1;

/**
 * -------------- Tables Creation ----------------
 */

CREATE TABLE admins (
    admin_id NUMBER NOT NULL,
    admin_email VARCHAR2(50) NOT NULL,
    admin_password VARCHAR2(100) NOT NULL,
    admin_name VARCHAR2(100),

    CONSTRAINT pk_admin PRIMARY KEY (admin_id),
    CONSTRAINT unique_admin_email UNIQUE (admin_email)
);


CREATE TABLE states (
    state_id NUMBER,
    state_name VARCHAR2(200),

    CONSTRAINT pk_state PRIMARY KEY (state_id)
);

CREATE TABLE cities (
    city_id NUMBER,
    city_name VARCHAR2(200),
    zip_code VARCHAR2(10),
    state_id NUMBER,

    CONSTRAINT pk_city PRIMARY KEY (city_id),
    CONSTRAINT fk_state_city FOREIGN KEY (state_id) REFERENCES states (state_id) on delete cascade
);


CREATE TABLE Customer_type (
    cus_type_id NUMBER NOT NULL,
    cus_type_name VARCHAR2(50),
    
    CONSTRAINT pk_cus_type PRIMARY KEY (cus_type_id)
);

CREATE TABLE customer (
    customer_id  NUMBER NOT NULL,
    cus_type_id NUMBER,
    firstName VARCHAR2(50) NOT NULL,
    lastName VARCHAR2(50),
    phone VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    city_id NUMBER NOT NULL,
    password VARCHAR2(50) NOT NULL,

    CONSTRAINT pk_customer PRIMARY KEY (customer_id),
    CONSTRAINT unique_customer_email UNIQUE (email),
    CONSTRAINT unique_customer_phone UNIQUE (phone),
    CONSTRAINT fk_cus_type_customer_id FOREIGN KEY (cus_type_id) REFERENCES Customer_type (cus_type_id) on Delete cascade,
    CONSTRAINT fk_city_customer FOREIGN KEY (city_id) REFERENCES cities (city_id)
);



CREATE TABLE stores (
    store_id NUMBER NOT NULL,
    customer_id NUMBER,
    store_name VARCHAR2(50) NOT NULL,
    store_description VARCHAR2(255) NOT NULL,
    logo BLOB,
    logo_mime_type VARCHAR2(512),
    logo_filename VARCHAR2(512),
    logo_charset VARCHAR2(512),
    logo_last_updated DATE,

    CONSTRAINT pk_store PRIMARY KEY (store_id),
    CONSTRAINT unique_store_name UNIQUE (store_name),
    CONSTRAINT fk_seller_store FOREIGN KEY (customer_id) REFERENCES customer (customer_id) on delete cascade
);

CREATE TABLE categories (
    category_id NUMBER NOT NULL,
    category_name VARCHAR2(50) NOT NULL,
    category_parent NUMBER DEFAULT NULL,

    CONSTRAINT pk_categ PRIMARY KEY (category_id)
);

CREATE TABLE variants (
  variant_id NUMBER,
  variant_name VARCHAR2(50),
  category_id NUMBER,

  CONSTRAINT pk_varinat PRIMARY KEY (variant_id),
  CONSTRAINT fk_categ_variant FOREIGN KEY (category_id) REFERENCES categories (category_id) on delete cascade
);

CREATE TABLE product (
    product_id NUMBER  NOT NULL,
    product_name VARCHAR2(100) NOT NULL,
    product_description VARCHAR2(255),
    unit_price NUMBER(10,2) NOT NULL,
    discount number,
    created_at DATE DEFAULT SYSDATE,
    category_id NUMBER(4),
    store_id NUMBER(4),

    CONSTRAINT pk_prod PRIMARY KEY (product_id),
    CONSTRAINT fk_categ_product FOREIGN KEY (category_id) REFERENCES Categories (category_id) on delete cascade,
    CONSTRAINT fk_product_store FOREIGN KEY (store_id) REFERENCES stores (store_id) on delete cascade
);

CREATE TABLE variant_stock (
    stock_id number,
    product_id number,
    variant_1 varchar2(250),
    variant_2 varchar2(250),
    variant_3 varchar2(250),
    Stock_quantity number,

    CONSTRAINT pk_variant_stock PRIMARY KEY (stock_id),
    CONSTRAINT fk_product_prod_variant FOREIGN KEY (product_id) REFERENCES product (product_id) on delete cascade
);

CREATE TABLE product_images (
    image_id number,
    product_id number,
    image BLOB,
    image_mime_type VARCHAR2(512),
    image_filename VARCHAR2(512),
    image_last_updated DATE,

    CONSTRAINT pk_image PRIMARY KEY (image_id),
    CONSTRAINT fk_image_product FOREIGN KEY (product_id) REFERENCES product (product_id) on delete cascade
);

CREATE TABLE customer_activity (
    activity_id   NUMBER,
    customer_id   NUMBER,
    product_id    NUMBER,
    visit_date    DATE,
    number_visit NUMBER,

    CONSTRAINT pk_customer_activity PRIMARY KEY (activity_id),
    CONSTRAINT fk_cutomer_activity FOREIGN KEY (customer_id) REFERENCES customer (customer_id) on delete cascade,
    CONSTRAINT fk_product_visited FOREIGN KEY (product_id) REFERENCES product (product_id) on delete cascade

);

CREATE TABLE issue_topics (
    topic_id NUMBER,
    topic VARCHAR2(250),

    CONSTRAINT pk_issue_topic PRIMARY KEY (topic_id)
);

CREATE TABLE issue_records (
    issue_record_id NUMBER,
    customer_id NUMBER,
    topic_id NUMBER,
    content VARCHAR2(4000),

    CONSTRAINT pk_issue_records PRIMARY KEY (issue_record_id),
    CONSTRAINT fk_topic_id FOREIGN KEY (topic_id) REFERENCES issue_topics (topic_id) ON DELETE CASCADE,
    CONSTRAINT fk_customer_support_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);


CREATE TABLE conversations (
    conversation_id number,
    participant_1_id number not null,
    participant_2_id number,

    constraint pk_conversations PRIMARY KEY (conversation_id),
    constraint fk_participant_1 FOREIGN KEY (participant_1_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    constraint fk_participant_2 FOREIGN KEY (participant_2_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);


CREATE TABLE messages (
    message_id  number,
    conversation_id number,
    message_content varchar2(4000),
    message_sender_id number,
    sent_at timestamp,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Read', 'Unread')),

    CONSTRAINT pk_message PRIMARY KEY (message_id),
    CONSTRAINT fk_conversation FOREIGN KEY (conversation_id) REFERENCES conversations (conversation_id) ON DELETE CASCADE,
    CONSTRAINT fk_message_sender FOREIGN KEY (message_sender_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

CREATE TABLE delivery_type (
    delivery_type_id NUMBER  NOT NULL,
    delivery_method VARCHAR2(100),
    delivery_price number,

    CONSTRAINT pk_delivery_type PRIMARY KEY (delivery_type_id)
);

CREATE TABLE orders (
    order_id NUMBER  NOT NULL,
    order_datetime TIMESTAMP(6) ,
    customer_id NUMBER NOT NULL,
    order_status VARCHAR2(10) NOT NULL CHECK (order_status IN ('Confirmed', 'Shipped', 'Cancelled', 'Pending')),
    order_information VARCHAR2(1000),
    payement_method number,
    delivery_type_id number,

    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) on delete cascade,
    CONSTRAINT fk_delivery_type_id FOREIGN KEY (delivery_type_id) REFERENCES delivery_type (delivery_type_id) on delete cascade
);   

CREATE TABLE order_items (
    order_id NUMBER  NOT NULL,
    line_item_id number NOT NULL,
    product_id NUMBER NOT NULL,
    unit_price NUMBER(10,2) NOT NULL,
    quantity Number NOT NULL,

    CONSTRAINT pk_order_items PRIMARY KEY (order_id, line_item_id),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES orders (order_id) on delete cascade,
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES product (product_id) on delete cascade
);

CREATE TABLE delivery (
    delivery_id NUMBER  NOT NULL,
    delivery_type_id NUMBER,
    order_id NUMBER,
    approx_date DATE,
    price VARCHAR2(10),
    delivery_type VARCHAR2(10),
    delivery_location VARCHAR2(50),

    CONSTRAINT pk_delivery PRIMARY KEY (delivery_id),
    CONSTRAINT fk_order_delivery FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT fk_delivery_delivery_type FOREIGN KEY (delivery_type_id) REFERENCES delivery_type (delivery_type_id)
);

CREATE TABLE Wishlist (
    wishlist_id NUMBER  NOT NULL,
    customer_id NUMBER,
    product_id NUMBER,
    
    CONSTRAINT pk_wishlist PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_customer_whishlist FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_product_whishlist FOREIGN KEY (product_id) REFERENCES Product (product_id) on delete cascade
);

CREATE TABLE wishlist_details (
    product_id NUMBER,
    wishlist_id NUMBER,
    
    CONSTRAINT pk_wishlist_product PRIMARY KEY (product_id,wishlist_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Product (product_id) on delete cascade,
    CONSTRAINT fk_wishlist FOREIGN KEY (wishlist_id) REFERENCES wishlist (wishlist_id)
);

create table reviews(
    review_id number not null,
    review varchar2(1000),
    rating number,
    customer_id number,
    product_id number,

    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES customer (customer_id) on delete cascade,
    CONSTRAINT fk_product_review FOREIGN KEY (product_id) REFERENCES Product (product_id) on delete cascade
);



/**
 * -------------- Triggers Creation ----------------
 */


COMMIT;

