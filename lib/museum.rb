class Museum
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_museums = DB.exec("SELECT * FROM museums;")
    museums = []
    returned_museums.each() do |museum|
      name = museum.fetch('name')
      id = museum.fetch('id').to_i
      museums.push(Museum.new({:name => name}))
    end
    museums
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO museums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:find) do |identity|
    Museums.all().each() do |museums|
      if museum.id() == identity
        return museum
      end
    end
  end

  define_singleton_method(:delete) do |id|
    DB.exec("DELETE FROM museums WHERE id = #{id}")
    DB.exec("DELETE FROM museums WHERE artwork_id = #{id}")
  end

  define_method(:==) do |another_museum|
    self.name == another_museum.name
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE museums SET name = '#{@name}' WHERE id = #{@id};")
  end
end
