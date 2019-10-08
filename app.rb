require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/witches_controller')
require_relative('controllers/familiars_controller')
require_relative('models/familiar')
require_relative('models/witch')
also_reload('../models/*')

get '/' do
  erb( :index )
end

get '/familiars' do
  @familiars = Familiar.all
  erb(:index)
end

get '/familiars/new' do
  @witches = Witch.all
  erb(:new)
end

post '/familiars' do
  Familiar.new(params).save
  redirect to '/familiars'
end

get '/familiars/:id' do
  @familiar = Familiar.find(params['id'])
  erb(:show)
end

get '/familiars/:id/edit' do
  @witches = Witch.all
  @familiar = Familiar.find(params['id'])
  erb(:edit)
end

post '/familiars/:id' do
  familiar = Familiar.new(params)
  Familiar.update
  redirect to "/familiars/#{params['id']}"
end

post '/familiars/:id/delete' do
  familiar = Familiar.find(params['id'])
  familiar.delete
  redirect to '/familiars'
end
