class CreateCoordenadas < ActiveRecord::Migration
  def change
    create_table :coordenadas do |t|
      t.text :Idtracker
      t.text :Latitud
      t.text :Longitud
      t.datetime :Datetime

      t.timestamps null: false
    end
  end
end
