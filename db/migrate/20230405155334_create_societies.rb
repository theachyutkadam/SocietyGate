class CreateSocieties < ActiveRecord::Migration[7.0]
  def change
    create_table :societies do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :location
      t.integer :status
      t.string :registration_number
      t.string :contact
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
