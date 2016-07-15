class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @name = attributes.fetch(:name)
  end

  define_singleton_method (:all) do
    all_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    all_stylists.each()do |stylist|
      stylists.push(Stylist.new({:id => stylist.fetch("id").to_i(), :name => stylist.fetch("name")}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id  =  result.first().fetch("id").to_i()
  end

  define_method(:==) do |other_stylist|
    self.id() == other_stylist.id()
  end

  define_singleton_method (:find) do |id|
    Stylist.all().each() do |stylist|
      if (stylist.id() == id)
        return stylist
      end
    end
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:clients) do
    selected_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
     clients_list = []

     selected_clients.each() do |client|
       clients_list.push(Client.new({:id => client.fetch("id").to_i(), :name => client.fetch("name"),:stylist_id => self.id()}))
     end
     clients_list
  end

end
