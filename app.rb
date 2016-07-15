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
