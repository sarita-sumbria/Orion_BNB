require 'pg'

class User
  attr_reader :username, :name, :email, :id

  def initialize(username:, name:, email:, id:)
    @username = username
    @name = name
    @email = email
    @id = id
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
    user = connection.exec("SELECT * FROM users WHERE username = '#{params['username']}'")
    User.new(username: user[0]['username'], email: user[0]['email'], name: user[0]['name'], id: user[0]['id'])
  end
end
