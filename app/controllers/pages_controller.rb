class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @charities = @user.charities
    @donations = @user.donations
    @list_of_amounts = []
    @list_of_dates = []
    @user.donations.all.each do |donation|
       @list_of_amounts << donation.donations_amount.to_i
       @list_of_dates << donation.started.month
    end

  end
end
