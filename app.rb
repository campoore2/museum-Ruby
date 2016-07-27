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

get '/curator/museums' do
  @museums = Museum.all()
  erb(:curator)
end

get '/curator/museums/new' do
  erb(:add_museum)
end

post '/curator/museums/new' do
  museum_name = params.fetch("museum_name")
  museum = Museum.new({:name => museum_name, :id => nil})
  museum.save()
  @museums = Museum.all()
  redirect('/curator/museums')
end

get '/curator/museums/:id' do
  @arts = Art.all()
  @museum = Museum.find(params['id'].to_i)
  @art = Art.find(params['id'].to_i)

  art = params.fetch('art_name')
  museum_id = params.fetch('museum_id').to_i()
  @museum = Museum.find(museum_id)
  @art = Art.new({:name => name, :museum_id => museum_id})
  @art.save()
  erb(:edit_museum)
end

patch '/curator/museums/:museum_id/edit' do
  museum = Museum.find(params.fetch('museum_id').to_i())
  name = params.fetch('museum_name')
  museum.update({:name => name})
  @museums = Museum.all()
  erb(:curator)
end

delete('/curator/museums/:museum_id/delete') do
  museum = Museum.find(params.fetch('museum_id').to_i())
  museum.delete
  @museums = Museum.all()
  redirect('/curator/museums')
end

get '/curator/artworks' do
  @museums = Museum.all()
  erb(:artworks)
end

get '/curator/artworks/add/' do
  erb(:add_art)
end

post '/curator/artworks/add' do
  name = params.fetch('artwork_name')
  museum_id = params.fetch('museum_id').to_i
  @art = Museum.art({:name => name, :museum_id => museum_id})
  art.save()
  redirect('/curator/museums')
end

get '/curator/artworks/:id' do
  @art = Art.find(params['id'].to_i)
  erb(:edit_art)
end

patch '/curator/artworks/:id/edit' do
  @art = Art.find(params['id'].to_i)
  name = params.fetch('art_name')
  @art.update({:name => name})
  @art = Art.all()
  redirect('/curator/museums')
end

delete('/curator/artworks/:id/delete') do
  @art = Art.find(params['id'].to_i)
  @art.delete
  @artworks = Art.all()
  redirect('/curator/museums')
end
