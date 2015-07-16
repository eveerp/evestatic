require 'rspec/expectations'

require_relative "../lib/evestatic/mapregions"

context 'when using the old csv based data' do

  describe Evestatic::MapRegion do
    it "can be accessed by id" do
      expect(Evestatic::MapRegion[10000032]).to be_a_kind_of(Evestatic::MapRegion)
      expect(Evestatic::MapRegion.by_id(10000032)).to be_a_kind_of(Evestatic::MapRegion)
    end
    it "can be accessed by name" do
      expect(Evestatic::MapRegion.by_name('Sinq Laison')).to be_a_kind_of(Evestatic::MapRegion)
    end

    describe "a region" do
      before do
        @sinq = Evestatic::MapRegion[10000032]
      end
      it "has a type_name" do
        expect(@sinq.region_name).to eq('Sinq Laison')
      end
      it "has a type_id" do
        expect(@sinq.region_id).to be_a_kind_of(Fixnum)
      end
    end
  end

end
