class Troquel < ApplicationRecord
	validates :numero, uniqueness: true
	has_one_attached :imagen
	
	MAQUINA = ["ETERNA", "PLANA", "MINERVA"]
	CATEGORIA = {0=>"SIN CATEGORIA",1=>"CB",2=>"CD",2=>"CE",3=>"BOL",4=>"TE"}

    def self.import(file)
        spreadsheet = Roo::Spreadsheet.open(file.path)
	    header = spreadsheet.row(1)

	    (2..spreadsheet.last_row).each do |i|
	      row = Hash[[header, spreadsheet.row(i)].transpose]
	      troquel = find_by(id: row['Codigo']) || new
	      troquel.attributes = row.to_hash.slice(*troquel.attribute_names)
	      troquel.save!
	    end
	end
end
