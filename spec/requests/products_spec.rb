require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "登録するとき" do
    before do
      @product = FactoryBot.attributes_for(:product)
    end

    it "商品情報が登録される" do
      expect do
        post "/api/v1/products",params:{product:@product}
      end.to change{Product.count}.by(1)
    end
  end
end
