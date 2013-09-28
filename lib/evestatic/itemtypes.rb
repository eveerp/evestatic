require 'csv'

module Evestatic
  class ItemType

    attr_accessor :type_id, :group_id, :type_name, :mass, :volume

    @@item_types_by_id = {}
    @@item_types_by_name = {}

    def self.load!
      ItemType.load_from_file(File.expand_path("../../../data/invTypes.csv", __FILE__))
    end
    
    def self.load_from_file(path)
      begin
        CSV.foreach(path, {col_sep: ";", headers: true}) do |row|
          @@item_types_by_id[row[0].to_i] = self.new(row[0].to_i, row[1].to_i, row[2], row[3].to_i, row[4].gsub(",",".").to_f)
          @@item_types_by_name[row[2]] = @@item_types_by_id[row[0].to_i]
        end
      rescue CSV::MalformedCSVError
        #trololol do nothing, we have all data, dont care if the newlines are windows mess or whatever
      end
    end


    # INDEXED BY TYPE_ID! Static::ItemType[34].type_name => "Tritanium"
    def self.[](key=nil)
      unless key
        @@item_types_by_id
      else
        @@item_types_by_id[key] || self.new(key, 0, "UKNOWN TYPE (#{key})",0,0.0)
      end
    end
    
    def self.by_id(id=nil)
      self.[](id)
    end
    
    # INDEXED BY NAME! Static::ItemType["Tritanium"].type_id => 34
    def self.by_name(key=nil)
      unless key
        @@item_types_by_name
      else
        @@item_types_by_name[key] || self.new(key, 0, "UKNOWN TYPE (#{key})",0,0.0)
      end
    end

    def initialize(type_id, group_id, type_name, mass, volume)                                                                                          
      self.type_id = type_id
      self.group_id = group_id
      self.type_name = type_name
      self.mass = mass
      self.volume = volume
    end

    load!
  end
  
end
