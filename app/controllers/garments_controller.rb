class GarmentsController < ApplicationController
  # before_action :require_login

  def index
    @garments = Garment.all
  end


end
