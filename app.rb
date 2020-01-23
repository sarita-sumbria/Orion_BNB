require 'sinatra/base'

class OrionBNB < Sinatra::Base

  get '/' do
    erb (:index)
  end

end
