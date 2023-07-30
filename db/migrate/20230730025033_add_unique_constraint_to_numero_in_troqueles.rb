class AddUniqueConstraintToNumeroInTroqueles < ActiveRecord::Migration[7.0]
  def change
    add_index :troqueles, :numero, unique: true
  end
end
