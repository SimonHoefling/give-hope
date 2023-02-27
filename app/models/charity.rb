class Charity < ApplicationRecord
  belongs_to :user
  belongs_to :cause
  has_many :donations
end
