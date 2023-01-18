CREATE TABLE customer(
    customer_id bigserial primary key NOT NULL, 
    customer_name varchar (255) NOT NULL,
    customer_phone varchar (255) NOT NULL,
    customer_phone_verified boolean NOT NULL,
    customer_email varchar (255) NOT NULL, 
    customer_email_verified boolean NOT NULL,
    customer_email_password varchar(255) NOT NULL
);


CREATE TABLE wallet(
	wallet_id bigserial primary key not null,
	customer_id bigserial not null,
	wallet_balance int,
	FOREIGN KEY (customer_id) references customer(customer_id)
);

CREATE TABLE products(
	product_id bigserial primary key not null,
	product_name varchar(250),
	product_price int
);

CREATE TABLE bookings(
	booking_id bigserial primary key not null,
	customer_id bigserial not null,
	product_id bigserial not null,
	FOREIGN KEY (customer_id) references customer(customer_id),
	FOREIGN KEY (product_id) references products(product_id)
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
