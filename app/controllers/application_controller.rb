
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/article/:id'do

  end

  get '/articles/new' do

  erb :new
  end

  get '/articles' do

  end

  post '/articles' do

  end

  get '/articles/:id/edit' do

  erb :edit
  end

  patch '/articles/:id' do

  end

  post '/articles/:id/delete' do

  end

end
