class AddAirtempAndWatertempToReadings < ActiveRecord::Migration[5.2]
  def change
    change_table :readings do |t|
      t.float :airtemp
      t.float :watertemp
    end
  end
end
