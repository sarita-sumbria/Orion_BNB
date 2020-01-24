class Spaces

  attr_reader :spaces_name, :address, :price_per_night, :space_owner

  def initialize(spaces_name:, address:, price_per_night:, space_owner:)
    @spaces_name = name
    @address = address
    @price_per_night = price_per_night
    @space_owner: space_owner
  end

# I am still working on the code. It's not complete yet.

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end


    results = connection.exec("select spaces_name, spaces.price, spaces.address, u.name from spaces inner join users u on spaces.space_owner = u.id;")
      results.map do |listing|
        Spaces.new(
            spaces_name: listing['spaces_name'],
            price: listing['price'],
            address: listing['address'],
            space_owner: listing['name']
        )
    end
  end

  # I have to include the owner for the spaces. Still working on it.

    def self.create(name:, description:, price_per_night:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'orion_bnb_test')
      else
        connection = PG.connect(dbname: 'orion_bnb')
      end

      result = connection.exec("INSERT INTO spaces (name, description, price_per_night) VALUES('#{name}', '#{description}', '#{price_per_night}') RETURNING id, name, description, price_per_night")
      Spaces.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'])
    end

    def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    connection.exec("DELETE FROM spaces WHERE id = #{id}")
  end

end
