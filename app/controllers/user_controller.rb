class UserController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def register_view
    render 'users/registrations/new'
  end

  def index
    authorize User
  end

  def show
    authorize @offer
  end

  def create
    authorize Offer
  end

  def update
    authorize @offer
  end

  def destroy
    authorize @offer
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {})
  end
end
