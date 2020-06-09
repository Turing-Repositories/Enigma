require './lib/enigma'

reader = File.open(ARGV[0], "r")
message = reader.read.chomp
reader.close

decrypter = Enigma.new(message, ARGV[2], ARGV[3])
decrypted = decrypter.encrypt

writer_file = File.open(ARGV[1], "w")
writer_file.write(decrypted_message)
writer.close

puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypt[:date]}"
