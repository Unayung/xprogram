name = ARGV[0]
name ||= ""
msg = "#{name} Welcome to X-Program"
msg = "#{msg} #{Time.now}"
puts "="*msg.size
puts msg
puts "="*msg.size
