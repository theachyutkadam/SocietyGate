class CreateTenentHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :tenent_histories do |t|
      t.references :tenant, null: false, foreign_key: { to_table: :users }
      t.references :flat, null: false, foreign_key: true
      t.date :move_in_at
      t.date :move_out_at

      t.timestamps
    end
  end
end
