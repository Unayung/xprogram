require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL

url = "http://24h.pchome.com.tw/"
Capybara.javascript_driver = :selenium
Capybara.current_driver = :selenium

visit(url)

find('input#keyword').set('nintendo switch')
find('input#doSearch').click
sleep(30)
