class ProductsController < ApplicationController

    DEFAULT_SIZE = 10
    DEFAULT_PAGE = 1

    def list_products
        params = product_params
        render json: ProductsService.list_products(params[:page].try(:to_i) || DEFAULT_PAGE,
                                                    params[:size].try(:to_i) || DEFAULT_SIZE,
                                                    params[:query],
                                                    params[:currency])
    end

    def product_params
        params.permit(:page,:size,:query,:currency)
    end

end