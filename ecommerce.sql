CREATE TABLE category(
	category_id bigserial primary key not null,
	category_name varchar(40)
);

CREATE TABLE product(
	product_id bigserial primary key not null,
	prodcut_name varchar(50),
	product_price int,
	specification varchar(250),
	quantity int,
	category_id bigserial not null,
	is_bestseller boolean,
	FOREIGN KEY (category_id) references category(category_id)
);

CREATE TABLE product_variant(
	product_variant_id bigserial primary key not null,
	category_id bigserial not null,
	product_id bigserial not null,
	variant_name varchar(100),
	variant_price int,
	variant_quantity int,
	FOREIGN KEY(category_id) references category(category_id),
	FOREIGN KEY(product_id) references product(product_id)
);

CREATE TABLE wishlist(
	wishlist_id bigserial primary key not null,
	product_variant_id bigserial not null,
	FOREIGN KEY (product_variant_id) references product_variant(product_variant_id));

CREATE TABLE customer(
    customer_id bigserial primary key NOT NULL, 
    customer_name varchar (255) NOT NULL,
    customer_phone varchar (255) NOT NULL,
    customer_phone_verified boolean NOT NULL,
    customer_email varchar (255) NOT NULL, 
    customer_email_verified boolean NOT NULL,
    customer_email_password varchar(255) NOT NULL,
	wishlist_id bigserial not null,
	FOREIGN KEY (wishlist_id) references wishlist(wishlist_id));

CREATE TABLE address(
	address_id bigserial PRIMARY KEY NOT NULL,
	houseno varchar(10),
	street varchar(60),
	city varchar(20),
	citystate varchar(40),
	country varchar(20),
	is_defaultaddress boolean NOT NULL,
	customer_id bigserial NOT NULL,
	FOREIGN KEY (customer_id) references customer(customer_id));
	

CREATE TABLE promotions(
	promotion_id bigserial primary key not null,
	promotion_description varchar(100),
	product_id bigserial not null,
	promotion_price int,
	promotion_startdate date,
	promotion_enddate date,
	FOREIGN KEY (product_id) references product(product_id));
	
CREATE TABLE cart(
	cart_id bigserial primary key not null,
	customer_id bigserial not null,
	product_variant_id bigserial not null,
	product_quantity int,
	FOREIGN KEY(product_variant_id) references product_variant(product_variant_id)
);

CREATE TABLE user_payment(
	user_payment_id bigserial primary key not null,
	order_id bigserial not null,
	customer_id bigserial not null,
	payment_status varchar(50),
	payment_type varchar(50),
	payment_provider varchar(100),
	expiry_date date,
	FOREIGN KEY (customer_id) references customer(customer_id)
);

CREATE TABLE order_tracking(
	order_tracking_id bigserial primary key not null,
	customer_id bigserial not null,
	tracking_status varchar(50),
	FOREIGN KEY (customer_id) references customer(customer_id)
);

CREATE TABLE shop_order(
	order_id bigserial primary key not null,
	cart_id bigserial not null,
	customer_id bigserial not null,
	user_payment_id bigserial,
	shop_order_status varchar(30),
	shipping_address varchar(255),
	shipping_order_value int,
	order_tracking_id bigserial not null,
	FOREIGN KEY (order_id) references shop_order(order_id),
	FOREIGN KEY (cart_id) references cart(cart_id),
	FOREIGN KEY (customer_id) references customer(customer_id),
	FOREIGN KEY (user_payment_id) references user_payment(user_payment_id),
	FOREIGN KEY (order_tracking_id) references order_tracking(order_tracking_id)
);