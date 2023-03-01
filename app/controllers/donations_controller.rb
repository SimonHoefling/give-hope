class DonationsController < ApplicationController
  before_action :set_charity, only: %i[new create]

  def new
    @donation = Donation.new
    @donation.charity = @charity
    @donation.user = current_user
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.charity = @charity
    @donation.user = current_user
    @donation.save
    redirect_to charity_path(@charity)
  end

  private

  def donation_params
    params.require(:donation).permit(:donations_amount, :started, :ended)
  end

  def set_charity
    @charity = Charity.find(params[:charity_id])
  end
end
