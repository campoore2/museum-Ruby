require('sinatra')
require ('sinatra/reloader')
require ("./lib/art")
require ("./lib/museum")
also_reload('lib/**/*.rb')
require ("pg")

DB = PG.connect({:dbname => 'museum_tracker'})

get('/') do
  erb(:index)
end

get '/curator/museums/' do
  erb(:curator)
end

get '/curator/museums/new' do
  erb(:add_museum)
end

post '/curator/museums/new' do
  museum_name = params.fetch("museum_name")
  museum = Museum.new({:name => museum_name})
  museum.save()
  @museums = Museum.all()
  erb(:curator)
end
