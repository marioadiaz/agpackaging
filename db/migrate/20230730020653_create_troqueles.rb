class CreateTroqueles < ActiveRecord::Migration[7.0]
  def change
    create_table :troqueles do |t|
      t.integer :categoria
      t.integer :numero
      t.string :desarrollo
      t.string :medida_cerrrada
      t.text :imagen
      t.string :texto
      t.integer :stock
      t.boolean :baja

      t.timestamps
    end
  end
end
