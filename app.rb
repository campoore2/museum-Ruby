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
  @museums = Museum.all()
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

get '/curator/museums/edit/' do
  @arts = Art.all()
  erb(:edit_museum)
end

patch '/curator/museums/edit/museum' do
  @name = params.fetch('museum_name')
  @museum.update({:name => @name})
  @museums = Museum.all()
  erb(:curator)
end

delete('/curator/museums/edit/museum') do
  @id = params.fetch('id').to_i
  Museum.delete(@id)
  @museums = Museums.all()
  erb(:curator)
end

get '/curator/artworks' do
  @museums = Museum.all()
  erb(:artworks)
end

get '/curator/artworks/add/' do
  erb(:add_art)
end
