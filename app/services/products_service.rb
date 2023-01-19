class ProductsService < ApplicationService

    DEFAULT_SIZE = 10
    DEFAULT_PAGE = 1

    def self.list_products(page, size, query = "", currency = "")
        products = find_products(page, size, query, currency)
        metadata = pagination_metadata(page, products.size)

        if products.empty?
            products = find_products(DEFAULT_PAGE, DEFAULT_SIZE, query, currency)
            metadata = pagination_metadata(DEFAULT_PAGE, products.size)
        end

        {
            metadata: metadata,
            products: products
        }
    end

    def self.find_products(page, size, query = "", currency = "")
        Product.by_name(query)
                .by_currency(currency)
                .limit(size)
                .offset(size * (page-1))
    end

end