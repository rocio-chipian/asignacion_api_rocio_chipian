# spec/controllers/products_controller_test.rb
require './spec/rails_helper'

RSpec.describe ProductsController, type: :controller do

  let!(:products) { [FactoryBot.create(:product1), FactoryBot.create(:product2), FactoryBot.create(:product3)] }
  
  describe "POST /products/?size=2&page=1&query=curs&currency=USD" do
     it "returns ok status" do
        post "list_products", params: {size: 10, page: 1, query: "curs", currency: "USD"}
        expect(response).to have_http_status(:success)
     end
  end

end
