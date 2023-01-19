class Product < ApplicationRecord

    scope :by_name, -> (name) { where("name LIKE ?", "%#{name}%") if name }
    scope :by_currency, -> (currency) { where(currency: currency) if currency }

end