class ProductController < ApplicationController
  def index
		@products = Product.order(:id).page params[:page]
  end
end
