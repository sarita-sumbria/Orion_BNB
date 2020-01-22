# Welcome to Orion BNB

This is a challenge undertaken by a team of 5. The goal for the challenge is "Can you, with only a specification to guide you, work as part of a team to build a web app?"

To meet this challenge, after being provided with specs we started by calling a team meeting to discuss how we will approach the challenge
from a TDD perspective. 

The tech stack that will be used for the project is;

* Sinatra: http://sinatrarb.com
* Ruby 2.6.5 https://www.ruby-lang.org/en/
* Postgres via a postgress gem called PG https://rubygems.org/gems/pg/versions/0.18.4
* RuboCop https://github.com/rubocop-hq/rubocop
* Rspec for TDD https://rspec.info/
* Trello 

During the discussion, we came up with an initial feel with what we deemed to be mandatory to include and the items we deemed to be good to have
but not essential to the goal of an MVP over 2 days.

[logo]: /dev/images/planning.jpg "Planning Session"
![logo]

As you can see from the planning session, we have so far decided that we will create three classes to hold the core logic, we will use postgress for persistent storage
and with postgress we will create several tables to store the data.

## Persistent Data (Database Tables)

During the discovery process we found that we would require at least the following table names: USERS, SPACES, BOOKINGS.

USERS: Will store both the details of the person making a request to rent a space and the owner of that space, at a minimum we
would require the users username, password and email address. Each record will be crated with a primary key, as shown below unless stated, tables will
use VARCHAR(X) with X being the total number of chars.

Users table

|ID (P/k) | Username | Password | Email Address | Name|
|---------|----------|----------|---------------|-----|
|1|test_user|password123|something@gmail.com| Some User|
|2|renter_user|password123|renter@gmail.com| Renter User|

SPACES: Will store the items that owners want to rent out, each space will have an ID, name, price, address, owner and a description.
The spaces table will reference the Users table for the owner field, for example an owner with a ID of 1 would be linked to the 
owner column which will be a foreign key.

Spaces Table

|ID (P/K) | Name | Price | Address | Owner(F/K) | Description|
|---------|------|-------|---------|-------|------------|
|1| Space Hotel | 499.99 | Earth Orbit | 1 |Luxury space station room on the outer ring with epic views of earth 7 times per day|
|2| Moon Hotel | 899.99 | Moon | 1 |Luxury moon station room with views of the stars without light pollution|

BOOKING: Will store all the booking information, ID of booking with a primary key, Owner will point to the P/K of the owner of that space
the renter field will hold the P/K of the user who wants to rent the space. The final field will be true if the owner of the space
has confirmed the booking otherwise it will be empty (One of the specifications for the challenge requests that multiple people can book a space UNTIL it has 
been confirmed by the owner)

Booking Table

|ID (P/K)| Owner (F/K) | Renter (F/K) | Booked (Boolean) |
|--------|-------------|--------------|------------------|
| 1 | 1 | 2 | true |
| 2 | 1 | null | false

These tables have been devised from our initial discovery meeting, there are some gaps still that need to be considered such as ensuring that once a booking
has been confirmed by the owner that it is then taken out of the pool of available spaces.

Other considerations not yet covered by the database tables is the time elements, so storing the date and time of the booking start and end.


## Classes

During our discovery session we concluded the we would need several classe to handle the functionality (logic) of our site.

### The USER class

This class will handle the user data, which will include creating a new user account, user profile and any booking listings the renter will have booked.

Users will also be allowed to post their Spaces to the site and can rent a space with the same user profile.



