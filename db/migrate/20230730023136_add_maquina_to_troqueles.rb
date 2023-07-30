class AddMaquinaToTroqueles < ActiveRecord::Migration[7.0]
  def change
    add_column :troqueles, :maquina, :string
  end
end
