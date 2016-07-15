require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

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
  stylist.update({:name => params.fetch("name")})
  @stylists = Stylist.all()

  erb(:stylists)
end

get("/stylists/:id/clients/new")do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()

  erb(:add_client_form)
end

patch("/stylists/:id/clients/new") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  client = Client.find(params.fetch("client_id").to_i())
  client.update({:name => client.name(), :stylist_id => @stylist.id()})

  @clients = @stylist.clients()

  erb(:stylist)
end


get("/clients") do
  @clients = Client.all()

  erb(:clients)
end

get("/clients/new") do
  erb(:clients_form)
end

post("/clients/new")do
  client = Client.new({:name => params.fetch("name"), :stylist_id => 0})
  client.save()
  @clients = Client.all()
  erb(:clients)
end

get("/clients/:id")do
  @client = Client.find(params.fetch("id").to_i())

  @clients = Client.all()

  erb(:client)
end

delete("/clients/:id")do
  client = Client.find(params.fetch("id").to_i())
  client.delete()
  @clients = Client.all()

  erb(:clients)
end

patch("/clients/:id")do
  client = Client.find(params.fetch("id").to_i())
  client.update({:name => params.fetch("name"),:stylist_id => client.stylist_id()})
  @clients = Client.all()

  erb(:clients)
end
