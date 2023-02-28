class AddDescriptionToCharities < ActiveRecord::Migration[7.0]
  def change
    add_column :charities, :description, :text
  end
end
