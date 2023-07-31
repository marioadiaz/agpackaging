class ChangeImagenTypeInTroquels < ActiveRecord::Migration[7.0]
  def change
    change_column :troquels, :imagen, :binary, using: 'imagen::bytea'
  end
end
