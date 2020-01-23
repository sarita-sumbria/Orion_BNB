require 'sinatra/base'

class OrionBNB < Sinatra::Base

  get '/' do
    erb (:landing)
  end

  get '/sign_up' do
    erb :sign_up
  end


  get '/log_in' do
    erb :log_in
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


  get '/addlist' do
    erb :addlist
  end


end
