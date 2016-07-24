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

patch '/curator/museums/edit/:museum_id' do
  museum = Museum.find(params.fetch('museum_id').to_i())
  name = params.fetch('museum_name')
  @museum.update({:name => @name})
  @museums = Museum.all()
  erb(:curator)
end

delete('/curator/museums/:museum_id/delete') do
  museum = Museum.find(params.fetch('museum_id').to_i())
  Museum.delete()
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

post '/curator/artworks/add' do
  @name = params.fetch('artwork_name')
  art = art.new({:name => @name})
  art.save()
  erb(:edit_museum)
end
