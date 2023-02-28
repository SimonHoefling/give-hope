class RemoveStatusFromDonations < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :status
  end
end
