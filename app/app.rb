ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  #Here we view the links
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # Here we get the form where we insert our links
  get '/links/new' do
    erb :'links/new_links'
  end

  # Here we create and store our links into a database. The links are extracted from the params.
  # Then we are redirected to links to view the new collection of links
  post '/links' do
    p params
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  # get '/tags/:name' do
  #   tag = Tag.first(name: params[:name])
  #   @links = tag ? tag.links : []
  #   erb :'links/index'
  # end

  get '/tags/:tagname' do
    tag = Tag.first(name: params[:tagname])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/links')
  else
    flash.now[:notice] = 'Password and confirmation password do not match'
    erb :'users/new'
  end
end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  run! if app_file == $0
end
