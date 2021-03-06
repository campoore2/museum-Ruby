class Art
  attr_reader(:name, :id ,:museum_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
    @museum_id = attributes.fetch(:museum_id)
  end

  define_method(:==) do |another_art|
     self.name == another_art.name && self.id() == another_art.id
  end

  define_singleton_method(:all) do
    returned_art = DB.exec('SELECT * FROM artworks;')
    arts = []
    returned_art.each() do |art|
      name = art.fetch("name")
      id = art.fetch("id").to_i()
      museum_id = art.fetch("museum_id").to_i()
      arts.push(Art.new({:name => name, :museum_id => museum_id, :id => id}))
    end
    arts
  end

  define_singleton_method(:find) do |id|
    found_art = nil
    Art.all().each() do |art|
      if art.id() == id
        found_art = art
      end
    end
    found_art
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO artworks(name, museum_id) VALUES ('#{name}', '#{museum_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_method(:delete) do
    DB.exec("DELETE FROM artworks WHERE id = #{self.id}")
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    DB.exec("UPDATE artworks SET name = '#{@name}', museum_id = #{@museum_id} WHERE id = #{@id}")
  end
end
