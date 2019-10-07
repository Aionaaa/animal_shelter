require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/witches_controller')
require_relative('controllers/familiars_controller')

get '/' do
  erb( :index )
end
