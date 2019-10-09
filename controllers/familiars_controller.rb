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

get '/familiars/:id' do
  @familiar =
  Familiar.find(params['id'].to_i)
  erb(:"familiars/show")
end

get '/familiars/new' do
  @witches = Witch.all
  @familiars = Familiar.all
  erb(:"familiars/adopt")
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
