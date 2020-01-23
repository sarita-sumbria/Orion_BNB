require 'sinatra/base'
require './lib/user'

class OrionBNB < Sinatra::Base
  enable :sessions
  #set :session_secret

  get '/' do
     erb :landing
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-sign-up' do
    @user = User.create(params)
    p @user
    session[:username] = params[:username]
    redirect '/listings'
  end

  get '/log-in' do
    erb :log_in
  end

  post '/user-log-in' do
    session[:id] = User.find(email: params[:email], password: params[:password])
  end

  get '/user-log-out' do
    session['id'] = ' '
    redirect '/'
  end


  get '/listings' do
    erb :listings
  end


  get '/profile' do
    erb :profile
  end


  get '/inbox' do
    erb :inbox

  end


  get '/book' do
    erb :book
  end


  get '/add-listing' do
    erb :add_listing
  end


end
