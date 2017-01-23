class GarmentsController < ApplicationController
  before_action :set_garment, only: %i(new create edit update destroy)
  # before_action :require_login

  def index
    @garments = Garment.all
  end

  def new
  end

  def create
    if @garment.save
      redirect_to garments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @garment.save
      redirect_to garments_path
    else
      render :edit
    end
  end

  def destroy
    @garment.destroy if @garment
    redirect_to garments_path
  end

  private

  def set_garment
    @garment = params[:id] ? Garment.find_by(id: params[:id]) : Garment.new
    @garment.assign_attributes(garment_params) if @garment && params[:garment]
  end

  def garment_params
    params.require(:garment)
          .permit(:name, :sku, :color, :kind, :size, :price, :brand)
  end
end
