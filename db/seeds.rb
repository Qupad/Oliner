# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

threads = []

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Onliner.csv'))
# csv = CSV.new(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# while row = csv.shift
# end
CSV.foreach('lib/seeds/Onliner1.csv', :headers => true, :encoding => 'UTF-8') do |records|
	threads << Thread.new(records) do |row|
		t = Product.new
		t.type = row['type']
		t.name = row['name']
		t.price = row['price']
		t.description = row['description']
		t.status = row['status']
		t.url = row['url']
		t.save
		puts "#{t.name}, #{t.price}"
	end
threads.each {|thr| thr.join}
end


puts "There are now #{Product.count} rows in the product table"

