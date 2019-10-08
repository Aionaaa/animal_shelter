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
