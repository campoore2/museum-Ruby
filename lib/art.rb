class Art
  attr_reader(:name, :museum_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @museum_id = attributes.fetch(:museum_id).to_i()
    @id = attributes[:id] || nil
  end

  define_method(:==) do |another_art|
    (self.id() == another_art.id())
  end

  define_singleton_method(:all) do
    returned_art = DB.exec('SELECT id, name, museum_id FROM artworks;')
    arts = []
    returned_art.each() do |art|
      name = art.fetch("name")
      museum_id = art.fetch("museum_id").to_i()
      id = art.fetch("id").to_i()
      arts.push(Art.new({:name => name, :museum_id => museum_id, :id => id}))
    end
    arts
  end

  define_singleton_method(:find) do |identity|
    Art.all().each() do |art|
      if art.id() = identity
        return art
      end
    end
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO artworks(name, museum_id) VALUES ('#{name}', '#{museum_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_singleton_method(:delete) do |id|
    DB.exc("DELETE FROM artworks WHERE id = #{id}")
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    @museum_id = attributes.fetch(:museum_id).to_i()
    DB.exec("UPDATE museums SET name = '#{name}', museum_id = #{@museum_id} WHERE id = #{@id}")
  end
end
