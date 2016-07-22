require('spec_helper')

describe(Museum) do
  describe('.all') do
    it('starts out with an empty database and returns nil.') do
      expect(Museum.all()).to(eq([]))
    end
  end


end
