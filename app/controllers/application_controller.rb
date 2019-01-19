#
# require_relative '../../config/environment'
#
# class ApplicationController < Sinatra::Base
#
#   configure do
#     set :public_folder, 'public'
#     set :views, 'app/views'
#   end
#
#   get '/' do
#
#   end
#
#   get '/article/:id'do
#
#   end
#
#   get '/articles/new' do
#
#   erb :new
#   end
#
#   get '/articles' do
#
#   end
#
#   post '/articles' do
#
#   end
#
#   get '/articles/:id/edit' do
#
#   erb :edit
#   end
#
#   patch '/articles/:id' do
#
#   end
#
#   post '/articles/:id/delete' do
#
#   end
#
# end
# require "sinatra"
# require "sinatra/activerecord"
#
# set :database, "sqlite3:myblogdb.sqlite3"
#
# require "./models"
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
# index posts
get '/' do
	@posts = Post.all
	erb :index
end

# create post
post '/post' do
	@post = Post.create(title: params[:title], body: params[:body])
	redirect '/'
end

# show post
get '/post/:id' do
	@post = Post.find(params[:id])
	erb :post_page
end

# update post
put '/post/:id' do
	@post = Post.find(params[:id])
	@post.update(title: params[:title], body: params[:body])
	@post.save
	redirect '/post/'+params[:id]
end

# delete post
delete '/post/:id' do
	@post = Post.find(params[:id])
	@post.destroy
	redirect '/'
end
end
