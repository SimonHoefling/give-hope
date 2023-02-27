class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.float :donations_amount
      t.date :started
      t.date :ended
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :charity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
