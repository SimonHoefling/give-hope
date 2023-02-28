class AddNameToCharities < ActiveRecord::Migration[7.0]
  def change
    add_column :charities, :name, :string
  end
end
