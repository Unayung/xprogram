name = ARGV[0] #第一個參數
name ||= "" # 如果 name 已經存放東西，就保持原樣，如果 name 沒有存放東西，則將 "" 存放進去

birthday = ARGV[1] #第二個參數
birthday ||= ""

msg = name + " Welcome to X-Program"
msg = msg + " " + Time.now.to_s # .to_s 代表轉換為字串

puts "="* msg.size # .size 計算前面的物件的長度 msg.size 代表計算 msg 這個字串的總長度
puts msg
puts "="* msg.size
