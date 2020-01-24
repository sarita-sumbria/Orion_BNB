

CREATE TABLE spaces (
id serial PRIMARY KEY UNIQUE,
space_name varchar(50) NOT NULL,
description varchar(100) NOT NULL,
price_per_night FLOAT NOT NULL,
space_owner integer not null ,
FOREIGN KEY (space_owner) REFERENCES users (id)
);

