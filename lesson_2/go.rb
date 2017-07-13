require 'capybara'
require 'capybara/dsl'

include Capybara::DSL

Capybara.javascript_driver = :selenium
Capybara.current_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

url = "http://24h.pchome.com.tw/"
visit(url)

find('input#keyword').set('nintendo switch')
find('input#doSearch').click

sleep(3)
result_size = find('span#SearchInfo span').text.to_i
puts "result size #{result_size}"

i = 0
while i < result_size do
  item = all('dl.col3f')[i]
  name =  item.find('h5').text
  price = item.find('dd.c3f ul:first-child li span span').text
  puts "No.#{i} " + name + " - " + price
  i+=1
  height = i*190
  page.execute_script("window.scrollTo(0,#{height})")
end