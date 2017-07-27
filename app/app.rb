ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    link = Link.new(url: params[:url],
                    title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  run! if app_file == $0
end
