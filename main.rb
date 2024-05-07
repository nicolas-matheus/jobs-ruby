$LOAD_PATH <<'.'
require_relative 'product'
require_relative 'sale'
require_relative 'saleItem'
require_relative 'salesManager'

products = SalesManager.generate_products

sale_items = products.map { |product| SalesManager.create_sales_item(product) }

sale = SalesManager.create_sale(sale_items)

sale_json = SalesManager.response_as_json(sale, sale_items)

mid = sale_json.dig(:price) || sale.total_price / sale.total_products

value = sale_json.dig(:sale, :items) 
arr = []
value.map {|a| arr << a[:price]}

puts "Venda criada:"
puts "Número: #{sale.id}"
puts "Total de produtos: #{sale.total_products}"
puts "Total do preço: #{sale.total_price}"
puts "Média da compra: #{mid}"
puts "Valor do seu produto mais caro multiplicado por 10: #{arr.sort.reverse[0]*10}"
puts "resumo da compra: #{sale_json}"