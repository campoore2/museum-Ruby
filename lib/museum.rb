class Museum
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_museum = DB.exec('SELECT * FROM musuems;')
    museums = []
    returned_museum.each() do |museum|
      name = museum.fetch('name')
      id = museum.fetch('id').to_i
      museum.push(Museum.new({:name => name, :id => id}))
    end
    museums
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO museums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.irst().fetch("id").to_i
  end
end
