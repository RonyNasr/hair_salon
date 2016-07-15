require("rspec")
require("pg")
require("client")
require("stylist")



DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM client *;")
    DB.exec("DELETE FROM stylist *;")
  end
end
