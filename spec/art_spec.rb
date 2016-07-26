require('spec_helper')

describe(Art) do
  describe('#find') do
    it("finds a artwork from the database") do
      test_art = Art.new({:name => "David", :museum_id => 1})
      test_art.save()
      test_art1 = Art.new({:name => "Wolf Mother", :museum_id => 2})
      test_art.save()
      expect(Art.find(test_art.id())).to(eq(test_art))
    end
  end

  describe("#update") do
    it "finds a artwork and changes its values" do
      test_art = Art.new({:name => "David", :museum_id => 1})
      test_art.save()
      test_art.update({:name => "Commodus", :museum_id => 1})
      expect(test_art.name()).to(eq('Commodus'))
    end
  end

  describe("#==") do
    it "compares two artworks" do
      test_art = Art.new({:name => "David", :museum_id => 1})
      test_art1 = Art.new({:name => "David", :museum_id => 1})
      expect(test_art).to(eq(test_art1))
    end
  end

  describe(".all") do
    it "starts off with no art" do
      expect(Art.all()).to(eq([]))
    end
  end

  describe("#save") do
    it "saves a artwork to the artworks table" do
      test_art = Art.new({:name => "David", :museum_id => 1})
      test_art.save()
      expect(Art.all()).to(eq([test_art]))
    end
  end

  # describe("#delete") do
  #   it "deletes a artwork from the table" do
  #     test_art = Art.new({:name => "David", :museum_id => 1})
  #     test_art.save()
  #     Art.delete(test_art.id())
  #     expect(Art.all()).to(eq([]))
  #   end
  # end
end
