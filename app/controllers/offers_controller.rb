class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :book]

  # GET /offers
  # GET /offers.json
  def index
    # authorize Offer
    @offers = Offer.all.where("expire < ? OR expire IS ?", Time.now, nil)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    # authorize @offer
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    # authorize @offer
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book
    respond_to do |format|
      if @offer.update(customer: current_user.id, expire: Time.now + 86400)
        format.html { redirect_to @offer, notice: 'Offer was successfully booked.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:picture, :user, :customer, :expire)
    end
end
