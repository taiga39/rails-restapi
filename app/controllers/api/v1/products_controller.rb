class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    render json: (@products)
  end

  def create
    begin
      @product = Product.new(product_params)
      @product.save!
      render json: (@product),status:201
    rescue => error
      render json: (error),status:404
    end
  end

  def show
    render json: (@product)
  end

  def update
    begin
      @product.update!(product_params)
      render json: (@product),status:200
    rescue => error
      render json:(error),status:404
    end
  end

  def destroy
    @product.destroy
    render json: (Product.all),status:200
  end

  private
  def product_params
    params.permit(:title, :body,:image,:price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
