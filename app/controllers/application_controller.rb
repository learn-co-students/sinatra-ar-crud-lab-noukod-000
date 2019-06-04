
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Render the default page
  get '/' do

  end

# Allow user to create a new Post
  get '/posts/new' do
    erb :new
  end

# Display the posts
  post '/posts' do
    Post.create(:name => params[:name], :content => params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Allow to update the Record
  get '/posts/:id' do
    @post = Post.find(params[:id])
    if params.keys.include? "name"
      Post.update(params[:id], name: params[:name], content: params[:content])
      @post = Post.find(params[:id])
    end

    erb :show
  end

  # Allow to edit and update the Record
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    Post.update(params[:id], name: params[:name], content: params[:content])
    @post = Post.find(params[:id])

    erb :show
  end

  # Allow to delete a Record
  delete '/posts/:id/delete' do
    Post.delete params[:id]
    redirect '/posts'
  end

end
