
CREATE TABLE bookings (
id serial PRIMARY KEY UNIQUE,
booked boolean,
FOREIGN KEY renter  REFERENCES users(id),
FOREIGN KEY user_id REFERENCES owner,
FOREIGN KEY space_id REFERENCES spaces(id),
);
