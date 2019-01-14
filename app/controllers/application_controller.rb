require_relative '../../config/environment'



class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

#new
  get '/posts/new' do
    erb :new
  end

#create
  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end

#index
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#show
  get '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

#edit
  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    id = params["id"]
    new_params = {}
    old_post = Post.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_post.update(new_params)
    redirect "/posts/#{id}"
  end

#Delete by id
  delete '/posts/:id/delete' do
    @post = Post.find(params["id"])
    @post.destroy
    erb :delete
  end
end
