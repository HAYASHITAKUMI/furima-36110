class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string :address,                    null: false
      t.string :phone_number,                 null: false
      t.string :postal_code,               null: false
      t.integer :delivery_id,               null: false
      t.string :municipality,              null: false
      t.references :purchase,               null: false, foreign_key: true
      t.string :building_name
      t.timestamps
    end
  end
end
