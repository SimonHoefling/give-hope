require 'net/http'
require 'uri'
class CharitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @charities = Charity.all
    @charities.each do |charity|
      charity.set_total_donations
    end
    if params[:cause].present?
      @charities = Charity.joins(:cause).where(causes: { id: params[:cause] })
      @charities.each do |charity|
        charity.set_total_donations
      end
    end
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    res = Net::HTTP.get_response(URI('https://source.unsplash.com/random/700x700/?charity'))
    @charity.image = res['location']
    @charity.save
    redirect_to charity_path(@charity)
  end

  def show
    @charity = Charity.find(params[:id])
    @charity.set_total_donations
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
  end

  def update
    @charity = Charity.find(params[:id])
    @charity.update(charity_params)
    redirect_to charity_path(@charity)
  end
  private

  def charity_params
    params.require(:charity).permit(:name, :total_donations, :address, :accepting, :cause_id, :photo)
  end


end
