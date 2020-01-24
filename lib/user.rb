require 'pg'

class User

  attr_reader :username, :name, :email

  def initialize(username:, name:, email:)
    @username = username
    @name = name
    @email = email
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
      connection.exec("INSERT INTO users (username, name, email, password) VALUES('#{params['username']}', '#{params['name']}', '#{params['email']}', '#{params['password']}') ")
  end

  def self.find(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end

    result = connection.exec("SELECT * FROM users WHERE username = '#{params['username']}' AND password = '#{params['password']}'")
    User.new(
      username: result[0]['username'],
      name: result[0]['name'],
      email: result[0]['email']
    )
  end
end
