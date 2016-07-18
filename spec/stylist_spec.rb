require('spec_helper')

describe (Stylist) do

  describe('#initialize') do
    it ('creates an instance of Stylist') do
      stylist = Stylist.new({:name => "Johnny Bravo"})

      expect(stylist.name()).to(eq("Johnny Bravo"))
    end
  end

  describe('.all') do
    it ("lists all the stylists ") do
      stylist = Stylist.new({:name => "Johnny Bravo"})
      stylist.save()

      expect(Stylist.all()).to(eq([stylist]))
    end
  end


  describe ('#save') do
    it('saves a new stylist to the database') do
      stylist = Stylist.new({:name => "Johnny Bravo"})
      stylist.save()

      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#==') do
    it ("returns false if it's not the same stylist ") do
      stylist_1 = Stylist.new({:name => "Johnny Bravo"})
      stylist_1.save()
      stylist_2 = Stylist.new({:name => "Johnny Bravo"})
      stylist_2.save()

      expect(stylist_1.==(stylist_2)).to(eq(false))
    end

    it ("returns true if it's not the same stylist ") do
      stylist_1 = Stylist.new({:name => "Johnny Bravo"})
      stylist_1.save()
      stylist_2 = Stylist.new({:name => "Johnny Bravo"})
      stylist_2.save()

      expect(stylist_1.==(stylist_1)).to(eq(true))
    end
  end

  describe('.find') do
    it ("returns false if it's not the same stylist ") do
      stylist_1 = Stylist.new({:name => "Johnny Bravo"})
      stylist_1.save()
      stylist_2 = Stylist.new({:name => "Johnny Bravo"})
      stylist_2.save()

      expect(Stylist.find(stylist_2.id())).to(eq(stylist_2))
    end
  end

  describe('#update') do
    it ("updates the name of a stylist") do
      stylist = Stylist.new({:name => "Johnny Bravo"})
      stylist.save()
      stylist.update({:name => "Johnny Depp"})

      expect(stylist.name()).to(eq("Johnny Depp"))
    end
  end


  describe('#delete') do
    it ("removes the name of a stylist") do
      stylist = Stylist.new({:name => "Johnny Bravo"})
      stylist.save()
      id = stylist.id()
      stylist.delete()

      expect(Stylist.find(id)).to(eq([]))
    end
  end

  describe('#clients') do
    it ("returns a list of clients") do
      stylist = Stylist.new({:name => "Johnny Bravo"})
      stylist.save()
      client_1 = Client.new({:name => "client1", :stylist_id => stylist.id()})
      client_1.save()
      expect(stylist.clients()).to (eq([client_1]))
    end
  end

end
