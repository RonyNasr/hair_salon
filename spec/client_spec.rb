require('spec_helper')

describe (Client) do

  describe('#initialize') do
    it ('creates an instance of Client') do
      client = Client.new({:name => "Johnny Bravo", :stylist_id => 1})

      expect(client.name()).to(eq("Johnny Bravo"))
    end
  end

  describe('.all') do
    it ("lists all the clients ") do
      client = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client.save()

      expect(Client.all()).to(eq([client]))
    end
  end


  describe ('#save') do
    it('saves a new client to the database') do
      client = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client.save()

      expect(Client.all()).to(eq([client]))
    end
  end

  describe('#==') do
    it ("returns false if it's not the same client ") do
      client_1 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_1.save()
      client_2 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_2.save()

      expect(client_1.==(client_2)).to(eq(false))
    end

    it ("returns true if it's not the same client ") do
      client_1 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_1.save()
      client_2 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_2.save()

      expect(client_1.==(client_1)).to(eq(true))
    end
  end

  describe('.find') do
    it ("returns false if it's not the same client ") do
      client_1 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_1.save()
      client_2 = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client_2.save()

      expect(Client.find(client_2.id())).to(eq(client_2))
    end
  end

  describe('#update') do
    it ("updates the name of a client") do
      client = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client.save()
      client.update({:name => "Johnny Depp", :stylist_id => 1})

      expect(client.name()).to(eq("Johnny Depp"))
    end
  end


  describe('#delete') do
    it ("removes the name of a client") do
      client = Client.new({:name => "Johnny Bravo", :stylist_id => 1})
      client.save()
      id = client.id()
      client.delete()

      expect(Client.find(id)).to(eq([]))
    end
  end

end
