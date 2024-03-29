require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/witch.rb')
require_relative('../models/familiar.rb')
also_reload('../models/*')

require("pry")

get '/familiars' do
  @familiars = Familiar.all()
  erb(:"familiars/index")
end

get '/familiars/new' do # new
  erb( :'familiars/new' )
end

post '/familiars/add' do # create
  @familiar = Familiar.new( params )
  @familiar.save()
  erb( :'familiars/create' )
end

get '/familiars/:id' do
  @familiar =
  Familiar.find(params['id'].to_i)
  erb(:"familiars/show")
end

get "/familiars/:id/adoption-form" do
  @familiar = Familiar.find(params['id'])
  @witches = Witch.all()
  erb(:"familiars/adopt")
end

post "/familiars/:id/assign" do
  familiar = Familiar.new(params)
  familiar.update()
  redirect to '/familiars'
end


get '/familiars/:id/edit' do # edit
  @familiar = Familiar.find( params[:id] )
  erb( :"familiars/edit" )
end

post '/familiars/:id/edit' do # update
  Familiar.new( params ).update
  redirect to '/familiars'
end

post '/familiars/:id/delete' do # delete
  familiar = Familiar.find( params[:id] )
  familiar.delete()
  redirect to '/familiars'
end
