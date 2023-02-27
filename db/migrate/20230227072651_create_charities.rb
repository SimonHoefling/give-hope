class CreateCharities < ActiveRecord::Migration[7.0]
  def change
    create_table :charities do |t|
      t.boolean :accepting
      t.text :address
      t.float :total_donations
      t.references :user, null: false, foreign_key: true
      t.references :cause, null: false, foreign_key: true

      t.timestamps
    end
  end
end
