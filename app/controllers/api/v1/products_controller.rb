module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]
      protect_from_forgery except: [:create,:update]

      def index
        @products = Product.all
        render json: (@products)
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: (@product),status:201
        else
          render json:{error:"404 error"},status:404
        end
      end

      def show
        render json: (@product)
      end

      def update
        if @product.update(product_params)
          render json: (@product),status:200
        else
          render json: {error:"404 error"},status:404
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
  end
end
