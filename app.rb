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

  erb(:stylist)
end

delete("/stylists/:id")do
  stylist = Stylist.find(params.fetch("id").to_i())
  stylist.delete()
  @stylists = Stylist.all()

  erb(:stylists)
end

patch("/stylists/:id")do
  stylist = Stylist.find(params.fetch("id").to_i())
  stylist.update(:name => params.fetch("name"))
  @stylists = Stylist.all()

  erb(:stylists)
end

get("/stylists/:id/clients/new")do
  @stylist = Stylist.find(params.fetch("id").to_i())

  erb(:add_client_form)
end

post("/stylist/:id/clients/new") do


  @stylist = Stylist.find(params.fetch("id").to_i())
  client = Client.new({:name => params.fetch("name"), :stylist_id => @stylist.id()})
  # client = Client.new({:name => "Johnny Bravo", :stylist_id => 141})
  client.save()
  @clients = @stylist.clients()

  erb(:stylist)
end


get("/clients") do
  erb(:clients)
end
