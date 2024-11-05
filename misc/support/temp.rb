
File.open("a_new.txt", "w+") do |f|
	File.readlines('auxiliary_names.txt').each do |line|
		f.puts (line.chomp!) + "  "
	end
end