require_relative 'enigma'

reader = File.open('lib/'+ARGV[0], "r")
message = reader.read.strip
reader.close

puts message

enigma = Enigma.new("cggtonzor loscybzwn!", ARGV[2], ARGV[3])

 puts message

decrypted = enigma.decrypt("cggtonzor loscybzwn!", ARGV[2], ARGV[3])


decryption = File.open('lib/'+ARGV[1], "w")
decryption.write(enigma.message, ARGV[2], ARGV[3])
decryption.close

puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
