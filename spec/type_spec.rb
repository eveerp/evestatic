require 'rspec/expectations'

require_relative "../lib/evestatic/itemtypes"

context 'when using the old csv based data' do

  describe Evestatic::ItemType do
    it "can be accessed by id" do
      expect(Evestatic::ItemType[34]).to be_a_kind_of(Evestatic::ItemType)
      expect(Evestatic::ItemType.by_id[34]).to be_a_kind_of(Evestatic::ItemType)
      expect(Evestatic::ItemType.by_id(34)).to be_a_kind_of(Evestatic::ItemType)
    end
    it "can be accessed by name" do
      expect(Evestatic::ItemType.by_name['Tritanium']).to be_a_kind_of(Evestatic::ItemType)
      expect(Evestatic::ItemType.by_name('Tritanium')).to be_a_kind_of(Evestatic::ItemType)
    end

    describe "a type" do
      before do
        @trit = Evestatic::ItemType[34]
      end
      it "has a type_name" do
        expect(@trit.type_name).to eq('Tritanium')
      end
      it "has a type_id" do
        expect(@trit.type_id).to be_a_kind_of(Fixnum)
      end
      it "has a group_id" do
        expect(@trit.group_id).to be_a_kind_of(Fixnum)
      end
      it "has a mass" do
        expect(@trit.mass).to be_a_kind_of(Fixnum)
      end
      it "has a volume" do
        expect(@trit.volume).to be_a_kind_of(Numeric)
      end
    end
  end
end
