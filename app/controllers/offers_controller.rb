class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :book]

  # GET /offers
  # GET /offers.json
  def index
    authorize Offer

    @offers = Offer.all.where("expire < ? OR expire IS ?", Time.now, nil)
    @offers = @offers.search params[:q], fields: [:name] if params[:q]
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    authorize @offer
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    authorize @offer
  end

  # GET /offers/1/edit
  def edit
    authorize @offer
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer

    respond_to do |format|
      if @offer.save
        Offer.delay.reindex

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
    authorize @offer

    respond_to do |format|
      if @offer.update(offer_params)
        Offer.delay.reindex

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
    authorize @offer

    @offer.destroy
    Offer.delay.reindex

    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book
    authorize @offer

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
