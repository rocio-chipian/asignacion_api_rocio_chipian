# spec/services/products_service_test.rb
require './spec/rails_helper'

RSpec.describe ProductsService, type: :service do

  let!(:products) { [FactoryBot.create(:product1), FactoryBot.create(:product2), FactoryBot.create(:product3)] }
  
    describe ".list_products" do
        it "it should default to default values when page and size are invalid" do
            products = ProductsService.list_products(page = 3, size = 10, query = "curs", currency = "USD")
            expect(products.size).to eq(2)
        end
    end

    describe ".find_products" do
        it "it should return products that match the filter criteria" do
            products = ProductsService.find_products(page = 1, size = 10, query = "curs", currency = "USD")
            expect(products.size).to eq(2)
        end

        it "it should return the correct amount of products according to pagination criteria" do
            products = ProductsService.find_products(size = 1, page = 1, query = "curs", currency = "USD")
            expect(products.size).to eq(1)
        end

        it "it should return no elements when none of them match the criteria" do
            products = ProductsService.find_products(size = 10, page = 1, query = "java", currency = "USD")
            expect(products.size).to eq(0)
        end
    end

end
