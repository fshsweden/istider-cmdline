require 'net/http'
require 'json'


puts ARGV.inspect

str = 'http://valbohcistider.se/apps/index.php?startdate=' + ARGV[0] + '&stopdate=' + ARGV[1]
puts str
uri = URI(str)
source = Net::HTTP.get(uri) # => String

src = JSON.parse(source)

src.each do |s|
	if s["Lag"] =~ /U15/  ||  s["Hemma"] =~ /U15/

		begin
			puts s["Kat"] + " " + s["Datum"] + " " + s["StartTid"] + " " + s["StoppTid"] + " "+ s["Lag"]
		rescue
			puts s.inspect
		end
	end
end

#puts src.inspect
