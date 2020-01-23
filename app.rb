require 'sinatra/base'

class OrionBNB < Sinatra::Base

  get '/' do
    erb (:landing)
  end

end
