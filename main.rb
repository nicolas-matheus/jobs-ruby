$LOAD_PATH <<'.'
require_relative 'product'
require_relative 'sale'
require_relative 'saleItem'
require_relative 'salesManager'

products = SalesManager.generate_products

sale_items = products.map { |product| SalesManager.create_sales_item(product) }

sale = SalesManager.create_sale(sale_items)

sale_json = SalesManager.response_as_json(sale, sale_items)

puts "Venda criada:"
puts "Número: #{sale.id}"
puts "Total de produtos: #{sale.total_products}"
puts "Total do preço: #{sale.total_price}"
puts "resumo da compra: #{sale_json}"