require 'csv'

module Evestatic
  class Station

    attr_accessor :station_id, :station_name, :solarsystem_id, :region_id

    @@stations = {}

    def self.load!
      Station.load_from_file(File.expand_path("../../../data/staStations.csv", __FILE__))
    end

    def self.load_from_file(path)
      begin
        CSV.foreach(path, {col_sep: ";", headers: true}) do |row|
          @@stations[row[0].to_i] = self.new(row[0].to_i, row[11], row[9].to_i, row[10].to_i)
        end
      rescue CSV::MalformedCSVError
        #trololol do nothing, we have all data, dont care if the newlines are windows mess or whatever
      end
    end


    def self.[](key=nil)
      unless key
        @@stations
      else
        @@stations[key]
      end
    end

    def self.by_id(id=nil)
      Station[id]
    end

    def self.by_name(name)
      @@stations.values.collect { |v| v if v.station_name.include? name }.compact[0]
    end

    def self.find_by_name(name)
      @@stations.values.collect { |v| v if v.station_name.include? name }.compact
    end

    def initialize(station_id, station_name,solarsystem_id,region_id)
      self.station_id = station_id
      self.station_name = station_name
      self.solarsystem_id = solarsystem_id
      self.region_id = region_id
    end
    
    load!
  end
  
end
