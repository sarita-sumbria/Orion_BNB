# Database table for bookings is called 'bookings'

require 'pg'

class Booking

   attr_reader :id, owner:, renter:, :space, :booked, :booking

   def initalize(id:, owner:, renter:, space: booked:, booking:)
    @id = id
    @owner = owner
    @renter = renter
    @space = space
    @booked = booked
    @booking = booking
   end

  #  Method for displaying all the available spaces
   def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    # some code to say return spaces that are available - 
    # this is done by if 'booked' column is listed as false then this is free so display it
    result = connection.exec("SELECT * FROM bookings WHERE booked='false';")
    result.map do |bookings|
      Booking.new(booked: bookings['booked'])
    end
  end

  #  Method for booking a space
   def self.create(booking:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    # some code to be able to book space -
    # there will be a buttons for the spaces to click on to book it

    # default='flase'
    result = connection.exec("UPDATE bookings SET booked = NOT booked WHERE id = #{booking:};")

  end

  def payment
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end


  end

end
