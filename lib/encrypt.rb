require_relative 'enigma'

reader = File.open('lib/'+ARGV[0], "r")
message = reader.read.strip
reader.close

  puts message

enigma = Enigma.new(message)
encrypted = enigma.encrypt(message, enigma.random_key_numbers, enigma.todays_date)

encryption = File.open('lib/'+ARGV[1], "w")
encryption.write(encrypted)
encryption.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
