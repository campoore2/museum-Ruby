class Museum
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id] || nil
  end

  define_singleton_method(:all) do
    returned_museums = DB.exec("SELECT * FROM museums;")
    museums = []
    returned_museums.each() do |museum|
      name = museum.fetch('name')
      id = museum.fetch('id').to_i
      museums.push(Museum.new({:name => name, :id => id}))
    end
    museums
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO museums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    found_museum = nil
    Museum.all().each() do |museum|
      if museum.id() == id
        found_museum = museum
      end
    end
    found_museum
  end

  define_method(:delete) do
    DB.exec("DELETE FROM museums WHERE id = #{self.id};")
    DB.exec("DELETE FROM artworks WHERE museum_id = #{self.id};")
  end

  define_method(:==) do |another_museum|
    self.name == another_museum.name && self.id == another_museum.id
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE museums SET name = '#{@name}' WHERE id = #{@id};")
  end

  def art
    list_art = []
    art = DB.exec("SELECT * FROM artworks WHERE museum_id = #{self.id()};")
    art.each() do |art|
      name = task.fetch('name')
      museum_id = task.fetch('museum_id').to_i()
      list_art.push(Art.new({:name => name, :museum_id => museum_id}))
    end
  list_art
  end
end
