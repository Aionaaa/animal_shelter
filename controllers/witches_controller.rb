require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/witch.rb')
require_relative('../models/familiar.rb')
also_reload('../models/*')

get '/witches' do
  @witches = Witch.all
  erb (:"witches/index")
end

get '/witches/:id' do
  @witch =
  Witch.find(params['id'].to_i)
  erb(:"witches/show")
end
