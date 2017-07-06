require 'nokogiri'
require 'rest-client'

url = "http://www.appledaily.com.tw/realtimenews/section/sports/"
base_url = "http://www.appledaily.com.tw" # 網站的基本網址
raw_data = RestClient.get(url)
data = Nokogiri::HTML(raw_data.body)
page_links = data.css('nav.page_switch a') # 底下分頁 1,2,3,4,5 的 a 元素

i = 0
while i < page_links.size do
  new_url = base_url+page_links[i][:href] # 利用迴圈方式將 page_links[0], page_links[1] ... 的 [:href] 網址，附加到基本網址之後. 產生我們要抓取的新網址
  raw_page_data = RestClient.get(new_url)
  page_data = Nokogiri::HTML(raw_page_data.body)
  list = page_data.css('ul.rtddd li.rtddt') # 將目標的 li 元素存到 list 變數中
  list.each do |li| # 利用 each 迴圈將 list 裡的 li 元素一個個進行操作
    puts li.css('font').text # 印出 li 元素內的 font 元素的文字(text)部份
  end
  i+=1 # while 迴圈最後別忘記要進行起始值的增加，不然會無限迴圈
end