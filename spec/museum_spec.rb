require('spec_helper')

describe(Museum) do
  describe('.all') do
    it('starts out with an empty database and returns nil.') do
      expect(Museum.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a value in the museums table") do
      test_museum = Museum.new({:name => "Smithsonian"})
      test_museum.save()
      expect(Museum.all()).to(eq([test_museum]))
    end
  end

  describe('#update') do
    it('changes the value of a museum') do
      test_museum = Museum.new({:name => "Muse"})
      test_museum.save()
      test_museum.update({:name => "Museum"})
      expect(test_museum.name()).to(eq("Museum"))
    end
  end

  describe("#delete") do
    it('will remove a museum from the database') do
      test_museum = Museum.new({:name => "Smithsonian"})
      test_museum.save()
      Museum.delete(test_museum.id())
      expect(Museum.all()).to(eq([]))
    end
  end

  describe("#==") do
    it('will return two of the same name') do
      test_museum = Museum.new({:name => "Smithsonian"})
      test_museum2 = Museum.new({:name => "Smithsonian"})
      expect(test_museum).to(eq(test_museum2))
    end
  end
end
