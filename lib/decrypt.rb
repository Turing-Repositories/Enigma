require_relative 'enigma'

reader = File.open('lib/'+ARGV[0], "r")
message = reader.read
reader.close

enigma = Enigma.new(message)
decrypted = enigma.decrypt(message, enigma.random_key_numbers, enigma.todays_date)

decryption = File.open(ARGV[1], "w")
decryption.write(message, ARGV[2], ARGV[3])
decryption.close

puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
