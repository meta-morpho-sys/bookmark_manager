require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
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
    # Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  run! if app_file == $0
end
