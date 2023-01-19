class ProductsService

    DEFAULT_SIZE = 10
    DEFAULT_PAGE = 1

    def self.list_products(page, size, query = "", currency = "")
        products = find_products(page, size, query, currency)
        products = products.empty? ? find_products(DEFAULT_PAGE, DEFAULT_SIZE, query, currency) : products

        products
    end

    def self.find_products(page, size, query = "", currency = "")
        Product.by_name(query)
                .by_currency(currency)
                .limit(size)
                .offset(size * (page-1))
    end

end