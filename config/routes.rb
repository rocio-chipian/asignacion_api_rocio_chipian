Rails.application.routes.draw do

  post "products", to:"products#list_products", as: "product"

end