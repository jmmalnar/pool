class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.integer :volume
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
