class SetDefaultTotalDonationsValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :charities, :total_donations, 0.0
  end
end
