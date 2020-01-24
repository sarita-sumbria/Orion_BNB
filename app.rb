require 'sinatra/base'
require './lib/user'
require './lib/spaces'

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
    session[:username] = params[:username]
    redirect '/log-in'
  end

  get '/log-in' do
    erb :log_in
  end

  post '/user-log-in' do
   user = User.find(params)
   session[:username] = user.username
   session[:id] = user.id
   redirect '/listings'
  end

  get '/user-log-out' do
    session['id'] = ' '
    redirect '/'
  end


  get '/listings' do
    erb :listings, :locals => {
      user: session[:username], spaces: Spaces.find_all_reversed
    }
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
    Spaces.create(params,session['id'])
    redirect '/listings'
  end


end
