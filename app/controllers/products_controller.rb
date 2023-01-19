class ProductsController < ApplicationController

    DEFAULT_SIZE = 10
    DEFAULT_PAGE = 1

    def list_products
        params = product_params

        page = params[:page].try(:to_i) || DEFAULT_PAGE
        size = params[:size].try(:to_i) || DEFAULT_SIZE
        query = params[:query]
        currency = params[:currency]

        render json: {
            metadata: pagination_metadata(page, size),
            products: ProductsService.list_products(page, size, query, currency)
        }
    end

    def product_params
        params.permit(:page,:size,:query,:currency)
    end

end