class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.integer :number
      t.integer :area_in_feet
      t.boolean :is_rented
      t.references :floor, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :tenant, null: false, foreign_key: { to_table: :users }
      t.integer :structure
      t.string :letter_box_number
      t.string :electricity_meter_number
      t.string :gas_meter_number

      t.timestamps
    end
  end
end
