class ModificarColumnaCerradaEnTroqueles < ActiveRecord::Migration[7.0]
  def change
    rename_column :troquels, :medida_cerrrada, :medida_cerrada
  end
end
