require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get("/stylists")do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/clients") do
  erb(:clients)
end

get("/stylists/new") do
  erb(:stylists_form)
end


post("/stylists")do
  stylist = Stylist.new({:name => params.fetch("name")})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end


get("/stylists/:id")do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = @stylist.clients()
  @stylists = Stylist.all()
  
  erb(:stylists)
end
