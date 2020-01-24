require 'pg'

class Spaces

  attr_reader :space_name, :description, :price_per_night, :space_owner

  def initialize(space_name:, description:, price_per_night:, space_owner:)
    @space_name = space_name
    @description = description
    @price_per_night = price_per_night
    @space_owner = space_owner
  end


  def self.find_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    results = connection.exec("select spaces.space_name, spaces.price_per_night, spaces.description, u.name from spaces inner join users u on spaces.space_owner = u.id;")
    results.map do |listing|
      Spaces.new(
        space_name: listing['space_name'],
        price_per_night: listing['price_per_night'],
        description: listing['description'],
        space_owner: listing['name']
      )
    end
  end


  def self.create(params, id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end

    connection.exec("INSERT INTO spaces (space_name, description, price_per_night) VALUES('#{params['space_name']}', '#{params['description']}', '#{params['price_per_night']}', '#{id}');")
  end


  def self.find_all_reversed
    find_all.reverse
  end

end
