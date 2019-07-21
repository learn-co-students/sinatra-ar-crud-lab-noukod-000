
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
# form process
  get '/posts/new' do #loads new form
    erb :new
  end
# C => Creation process
  post '/posts' do  #creates a post
    #binding.pry
    @post = Post.create(params)
    redirect to '/posts'
  end
# R => Read process
  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do # pull specific data from database
    #binding.pry
    @post = Post.find_by_id(params[:id])
    erb :show
  end
# U => Update process
  get '/posts/:id/edit' do
    #binding.pry
    @post = Post.find_by_id(params[:id])
    #binding.pry
    erb :edit
  end
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    #binding.pry # params have the patch data
    @post.name = params["name"]
    @post.content = params["content"]
    @post.save # real update is going there
    #binding.pry
    erb :show
  end
# D => Delete process
  delete '/posts/:id/delete' do
    #binding.pry
    @post = Post.find_by_id(params[:id])
    #binding.pry
    @post.delete # active records delete action
    #binding.pry # the data is avalauble on the post
    # the delete action is done already
    erb :deleted
  end
end
