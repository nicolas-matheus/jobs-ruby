$LOAD_PATH <<'.'
require_relative 'product.rb'
require_relative 'sale.rb'

module SalesManager
    def self.generate_products
      products = []
      5.times do |i|
        products << Product.new(i + 1, "Product #{i + 1}", rand(1.0..100.0).round(2))
      end
      products
    end
  
    def self.create_sales_item(product)
      SaleItem.new(product.id, product.id, product.price)
    end
  
    def self.create_sale(sale_items)
      total_products = sale_items.size
      total_price = sale_items.sum(&:price)
      Sale.new(1, total_products, total_price)
    end
end