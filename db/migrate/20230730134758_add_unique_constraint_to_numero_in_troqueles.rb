class AddUniqueConstraintToNumeroInTroqueles < ActiveRecord::Migration[7.0]
  def change
     add_index :troquels, :numero, unique: true
  end
end
