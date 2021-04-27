
File.open("test.md.new", "w+") do |i|
	File.readlines("auxiliary.md").each do |line|
		chomped_line = line.chomp!
		if chomped_line.include?(":")
			i.puts "# " + chomped_line
		else
			i.puts chomped_line
		end
	end    
end


