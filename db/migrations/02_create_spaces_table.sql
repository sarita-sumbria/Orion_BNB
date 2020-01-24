CREATE TABLE spaces (
id serial PRIMARY KEY UNIQUE,
name varchar(50) NOT NULL,
price FLOAT NOT NULL,
address varchar(100) NOT NULL,
space_owner integer not null ,
FOREIGN KEY (space_owner) REFERENCES users (id)
);