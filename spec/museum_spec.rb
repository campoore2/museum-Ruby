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

  describe('#find') do
    it("finds a museum from the database") do
      test_museum = Museum.new({:name => "David", :id => 1})
      test_museum.save()
      test_museum1 = Museum.new({:name => "Wolf Mother", :id => 3})
      test_museum1.save()
      expect(Museum.find(test_museum.id())).to(eq(test_museum))
    end
  end

  # describe("#delete") do
  #   it('will remove a museum from the database') do
  #     test_museum = Museum.new({:name => "Smithsonian"})
  #     test_museum.save()
  #     Museum.delete(test_museum.name())
  #     expect(Museum.all()).to(eq([]))
  #   end
  # end

  describe("#==") do
    it('will return two of the same name') do
      test_museum = Museum.new({:name => "Smithsonian"})
      test_museum2 = Museum.new({:name => "Smithsonian"})
      expect(test_museum).to(eq(test_museum2))
    end
  end

  describe('#art') do
    it('returns the id for the museum') do
      test_museum = Museum.new({:name => "moba", :museum_id => 1})
      expect(test_museum.art()).to(eq(1))
    end
  end
end
