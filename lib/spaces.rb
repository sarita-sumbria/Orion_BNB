class Spaces

  attr_reader :id, :name, :description, :price_per_night

  def initialize(id:, name:, description:, price_per_night:)
    @id: id
    @name = name
    @description = description
    @price_per_night = price_per_night
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end

    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
    Spaces.new(id: space['id'], name: space['name'], description: space['description'], price_per_night: space['price_per_night'])
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
