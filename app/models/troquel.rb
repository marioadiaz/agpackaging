class Troquel < ApplicationRecord
	validates :numero, uniqueness: true
	MAQUINA = [1 =>"ETERNA", 2 =>"PLANA", 3 =>"MINERVA"]
	CATEGORIA = {0=>"SIN CATEGORIA",1=>"CB",2=>"CD",2=>"CE",3=>"BOL",4=>"TE"}
	# app/models/troquel.rb

	class Troquel < ApplicationRecord
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

end
