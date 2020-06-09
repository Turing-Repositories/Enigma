require './lib/enigma'

reader = File.open(ARGV[0], "r")
message = reader.read.chomp
reader.close

encrypter = Enigma.new(message)
encrypted = encrypter.encrypt

writer_file = File.open(ARGV[1], "w")
writer_file.write(encrypted_message)
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
