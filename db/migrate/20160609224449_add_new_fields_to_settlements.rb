class AddNewFieldsToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :no, :integer
    add_column :settlements, :municipio, :string
    add_column :settlements, :nombre, :string
    add_column :settlements, :apellido_paterno, :string
    add_column :settlements, :apellido_materno, :string
    add_column :settlements, :curp, :string
    add_column :settlements, :telefono, :string
    add_column :settlements, :fecha_nacimiento, :date
    add_column :settlements, :cp, :string
    add_column :settlements, :colonia, :string
    add_column :settlements, :localidad, :string
    add_column :settlements, :calle, :string
    add_column :settlements, :num_casa, :integer
    add_column :settlements, :cruzamientos, :integer
    add_column :settlements, :dia, :string
    add_column :settlements, :mes, :string
    add_column :settlements, :anio, :string
    add_column :settlements, :sifode, :string
    add_column :settlements, :sexo, :string
    add_column :settlements, :resultado, :string
    add_column :settlements, :marginacion, :string
    add_column :settlements, :procedencia, :string
    add_column :settlements, :procede, :string
    add_column :settlements, :observacion, :string
  end
end
