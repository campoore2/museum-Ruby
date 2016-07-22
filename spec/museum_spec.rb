require('spec_helper')

describe(Museum) do
  # describe('.all') do
  #   it('starts out with an empty database and returns nil.') do
  #     expect(Museum.all()).to(eq([]))
  #   end
  # end

  describe('#save') do
    it("saves a value in the museums table") do
      test_museum = Museum.new({:name => "Smithsonian"})
      test_museum.save()
      expect(Museum.all()).to(eq([test_museum]))
    end
  end
end
