require 'pry-byebug'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
include Capybara::DSL

options = {
:window_size => [1280, 800], :js_errors => false
}
Capybara.javascript_driver = :poltergeist
Capybara.current_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

url = "http://140.118.31.215/querycourse/ChCourseQuery/QueryCondition.aspx"
visit(url)
year = 105
semester = 2
all('select#semester_list option').each do |option|
  if option.text.include?("#{year}#{semester}")
    option.select_option
  end
end

#save_screenshot

find('input#QuerySend').trigger('click')
second = 0
while !page.has_selector?('table#my_dg')
  sleep(1)
  second +=1
  puts "Sleeping ... #{second} sec."
end
puts "總共睡了 #{second} 秒"
#save_screenshot
courses_list = Nokogiri::HTML(page.body)
courses_list_trs = courses_list.css('table#my_dg tr:not(:first-child)')
courses_list_trs_count = courses_list_trs.count
puts courses_list_trs_count

courses_list_trs.each_with_index do |row, index|
  table_data = row.css('td')
  course_name = table_data[2].text #也可以印出其它位置觀察
  course_code = table_data[0].text
  course_credit = table_data[4].text
  puts "-------- No. #{index+1} --------"
  puts "課程名稱: #{course_name}"
  puts "課程代碼: #{course_code}"
  puts "學分: #{course_credit}"
  puts "--------------------"
end
