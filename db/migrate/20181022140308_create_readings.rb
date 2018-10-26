class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.datetime :datetime
      t.float :ph
      t.integer :alkalinity
      t.integer :chlorine
      t.integer :stabilizer
      t.references :pool, foreign_key: true

      t.timestamps
    end
  end
end
