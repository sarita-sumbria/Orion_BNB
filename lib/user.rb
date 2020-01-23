require 'pg'

class User
  attr_reader :username, :name, :email, :password

  def initialize(username:, name:, email:, password:)
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    result = connection.exec("INSERT INTO users (username, name, email, password) VALUES('#{params['username']}', '#{params['name']}', '#{params['email']}', '#{params['password']}') ")
    #User.new
  end

  def self.find(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'orion_bnb_test')
    else
      connection = PG.connect(dbname: 'orion_bnb')
    end
    result = connection.exec("SELECT *")
end