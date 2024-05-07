$LOAD_PATH <<'.'
require_relative 'product.rb'
require_relative 'sale.rb'

module SalesManager
    def self.generate_products
      [::Product.new(1,"Laranja",2.5), ::Product.new(2,"Pera",2.0), ::Product.new(3,"Maça",2.75), ::Product.new(4,"Banana",3.0)]
    end
  
    def self.create_sales_item(product)
      SaleItem.new(product.id, product.id, product.price)
    end
  
    def self.create_sale(sale_items)
      total_products = sale_items.size
      total_price = sale_items.sum(&:price)
      Sale.new(1, total_products, total_price)
    end

    def self.response_as_json(sale, sale_items)
      items = sale_items.map do |sale_item|
        { id: sale_item.id, product_id: sale_item.product_id, price: sale_item.price }
      end
      {
        sale: {
          id: sale.id,
          total_products: sale.total_products,
          total_price: sale.total_price,
          items: items
        }
      }
    end
end