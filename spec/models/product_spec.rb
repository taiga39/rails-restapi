require 'rails_helper'
describe Product do


  describe '#create' do
    it "商品タイトルが存在しているか" do

      product = FactoryBot.build(:product, title: "")
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end
    it "商品説明文が存在しているか" do
      product = FactoryBot.build(:product, body: "")
      product.valid?
      expect(product.errors[:body]).to include("can't be blank")
    end

    it "商品イメージが存在しているか" do
      product = FactoryBot.build(:product, image: "")
      product.valid?
      expect(product.errors[:image]).to include("can't be blank")
    end

    it "商品価格が存在しているか" do
      product = FactoryBot.build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end


	it "商品タイトルが長すぎないか" do
	  product = FactoryBot.build(:product,title: "a" * 101)
	  product.valid?
      expect(product.errors[:title]).to include("is too long (maximum is 100 characters)")
	 end

	it "商品説明文が長すぎないか" do
	  product = FactoryBot.build(:product,body: "a" * 501)
	  product.valid?
      expect(product.errors[:body]).to include("is too long (maximum is 500 characters)")
	 end
  end
end
