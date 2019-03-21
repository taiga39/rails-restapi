require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "情報を取得" do
    it "1件を取得する場合" do
      @product = FactoryBot.create(:product)
      get "/api/v1/products" + "/" +@product[:id].to_s
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json['title']).to eq @product.title
    end

    it "全件を取得する場合" do
      @product = FactoryBot.create_list(:product,3)
      get "/api/v1/products"
      expect(response.status).to eq 200
    end
  end

  describe "情報を登録" do
    it "商品情報が登録される" do
      @product = FactoryBot.attributes_for(:product)
      expect do
        post "/api/v1/products",params:@product
      end.to change{Product.count}.by(1)
      expect(response.status).to eq 201
    end

    it "正しくない登録" do
      @product = FactoryBot.attributes_for(:product,body: "a" * 501)
      post "/api/v1/products",params:@product
      expect(response.status).to eq 404
    end
  end

  describe "情報を更新" do
    it "情報が更新される" do
      @product = FactoryBot.create(:product)
      @newproduct = FactoryBot.attributes_for(:product,title: "newtitle")
      put "/api/v1/products"+ "/" +@product[:id].to_s,params:@newproduct
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json['title']).to eq @newproduct[:title]
    end
    it "情報が更新されない" do
      @product = FactoryBot.create(:product)
      @newproduct = FactoryBot.attributes_for(:product,title: "title" * 100)
      put "/api/v1/products"+ "/" +@product[:id].to_s,params:@newproduct
      expect(response.status).to eq 404
    end
  end

  describe "情報を削除" do
    before do
      @product = FactoryBot.create(:product)
    end
    it "削除" do
      expect {
        delete "/api/v1/products" + "/" + @product.id.to_s
      }.to change{ Product.count }.by(-1)
      expect(response.status).to eq 200
    end
  end
end
