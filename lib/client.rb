class Client
  attr_reader(:id, :name, :stylist_id)

  define_method (:initialize) do |attributes|
    @id = attributes[:id] || nil
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    all_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    all_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:id => id,:name => name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id  =  result.first().fetch("id").to_i()
  end

  define_method(:==) do |other_client|
    self.id() == other_client.id()
  end

  define_singleton_method(:find) do |id|
    Client.all().each() do |client|
      if client.id() == id
        return client
      end
    end
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

end
