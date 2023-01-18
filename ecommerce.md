# Ecommerce website Data Model

## Category Table 
- category_id (bigserial primary key not null)
- category_name (varchar(40))

## Product Table
- product_id (bigserial primary key not null)
- prodcut_name (varchar(50))
- product_price (int)
- specification (varchar(250))
- quantity (int)
- category_id (bigserial not null)
- is_bestseller (boolean)
- category_id (foreignkey, references category(category_id))

## Product Variant
- product_variant_id (bigserial primary key not null)
- category_id (bigserial not null)
- product_id (bigserial not null)
- variant_name (varchar(100))
- variant_price (int)
- variant_quantity (int)
- category_id(foreignkey, references category(category_id))
- product_id (foreignkey, references product(product_id))

## Wishlist Table
- wishlist_id (bigserial primary key not null)
- product_variant_id (bigserial not null)
- product_variant_id(foreignkey, references product_variant(product_variant_id))

## Customer Table
- customer_id (bigserial primary key NOT NULL) 
- customer_name (varchar (255) NOT NULL)
- customer_phone (varchar (255) NOT NULL)
- customer_phone_verified (boolean NOT NULL)
- customer_email (varchar (255) NOT NULL) 
- customer_email_verified (boolean NOT NULL)
- customer_email_password (varchar(255) NOT NULL)
- wishlist_id (bigserial not null)
- wishlist_id (foreignkey, references wishlist(wishlist_id))

## Address Table 
- address_id (bigserial PRIMARY KEY NOT NULL)
- houseno (varchar(10))
- street (varchar(60))
- city (varchar(20))
- citystate (varchar(40))
- country (varchar(20))
- is_defaultaddress (boolean NOT NULL)
- customer_id (bigserial NOT NULL)
- customer_id (foreignkey, references customer(customer_id))
	

## Promotions Table
- promotion_id (bigserial primary key not null)
- promotion_description (varchar(100))
- product_id (bigserial not null)
- promotion_price (int)
- promotion_startdate (date)
- promotion_enddate (date)
- product_id(foreignkey, references product(product_id))
	
## Cart Table
- cart_id (bigserial primary key not null)
- customer_id (bigserial not null)
- product_variant_id (bigserial not null)
- product_quantity (int)
- product_variant_id (foreignkey, references product_variant(product_variant_id))

## User Payment Table
- user_payment_id (bigserial primary key not null)
- order_id (bigserial not null)
- customer_id (bigserial not null)
- payment_status (varchar(50))
- payment_type (varchar(50))
- payment_provider (varchar(100))
- expiry_date (date)
- customer_id(foreignkey ,references customer(customer_id))

## Order tracking table
- order_tracking_id (bigserial primary key not null)
- customer_id (bigserial not null)
- tracking_status (varchar(50))
- customer_id (foreignkey ,references customer(customer_id))

## Shop order table
- order_id (bigserial primary key not null)
- cart_id (bigserial not null)
- customer_id (bigserial not null)
- user_payment_id (bigserial)
- shop_order_status (varchar(30))
- shipping_address (varchar(255))
- shipping_order_value (int)
- order_tracking_id (bigserial not null)
- FOREIGN KEY (order_id) references shop_order(order_id),
- FOREIGN KEY (cart_id) references cart(cart_id),
- FOREIGN KEY (customer_id) references customer(customer_id),
- FOREIGN KEY (user_payment_id) references user_payment(user_payment_id),
- FOREIGN KEY (order_tracking_id) references order_tracking(order_tracking_id)