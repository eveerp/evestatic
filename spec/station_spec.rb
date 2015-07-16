require 'rspec/expectations'

require_relative "../lib/evestatic/stations"

context 'when using the old csv based data' do

  describe Evestatic::Station do
    it "can be accessed by id" do
      expect(Evestatic::Station[60011866]).to be_a_kind_of(Evestatic::Station)
      expect(Evestatic::Station.by_id[60011866]).to be_a_kind_of(Evestatic::Station)
      expect(Evestatic::Station.by_id(60011866)).to be_a_kind_of(Evestatic::Station)
    end
    it "can be accessed by name" do
      expect(Evestatic::Station.by_name('Dodixie IX - Moon 20 - Federation Navy Assembly Plant')).to be_a_kind_of(Evestatic::Station)
    end

    describe "a station" do
      before do
        @fednavasspla = Evestatic::Station[60011866]
      end
      it "has a station_id" do
        expect(@fednavasspla.station_name).to be_a_kind_of(String)
      end
      it "has a station_id" do
        expect(@fednavasspla.station_id).to be_a_kind_of(Fixnum)
      end
      it "has a solarsystem_id" do
        expect(@fednavasspla.solarsystem_id).to be_a_kind_of(Fixnum)
      end
      it "has a region_id" do
        expect(@fednavasspla.region_id).to be_a_kind_of(Fixnum)
      end
    end
  end
end
