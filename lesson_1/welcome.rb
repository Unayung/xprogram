name = ARGV[0]
name ||= ""

msg = name + " Welcome to X-Program"
msg = msg + " " + Time.now.to_s

puts "="* msg.size
puts msg
puts "="* msg.size
