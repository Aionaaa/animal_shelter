require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/witch.rb')
require_relative('../models/familiar.rb')
also_reload('../models/*')

get '/familiars' do
  @familiars = Familiar.all()
  erb(:"familiars/index")
end

get '/familiars/:id' do
  @familiar =
  Familiar.find(params['id'].to_i)
  erb(:"familiars/show")
end
