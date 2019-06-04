
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  
  get '/posts/new' do
    erb :new
  end
  
  get '/posts/:id' do
    
  end
  
  
  get '/posts' do
    @posts = Post.all
    
    @posts.each do |post|
      
    end
    
    erb :index
  end
  
  post '/posts' do
    
  end
  
  
  
end
