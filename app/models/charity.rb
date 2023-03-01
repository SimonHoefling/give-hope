class Charity < ApplicationRecord
  belongs_to :user
  belongs_to :cause
  has_one_attached :photo
  has_many :donations, dependent: :destroy

  def set_total_donations
    total_donations = 0
    self.donations.each do |donation|
      total_donations += donation.donations_amount
    end
    self.total_donations = total_donations
  end

end
