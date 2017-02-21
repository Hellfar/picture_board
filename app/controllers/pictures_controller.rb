class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :book]

  # GET /pictures
  # GET /pictures.json
  def index
    authorize Picture
    @pictures = Picture.all.where("expire < ? OR expire IS ?", Time.now, nil)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    authorize @picture
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
    authorize @picture
    @picture.save
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book
    respond_to do |format|
      if @picture.update(customer: current_user.id, expire: Time.now + 86400)
        format.html { redirect_to @picture, notice: 'Picture was successfully booked.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:path, :user, :customer, :expire)
    end
end
