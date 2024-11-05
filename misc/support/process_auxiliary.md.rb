start = false
counter = 0
File.open("auxiliary.md.new", "w+") do |i|
	File.readlines("auxiliary.md").each do |line|
		chomped_line = line.chomp!
		if start
			if chomped_line.include?("#") && chomped_line.include?(":")
				counter += 1
				chomped_line[0] = ''
				if (counter-1) != 0
					i.puts ""
					i.puts "[<a href=\"##{(counter-1)}auxiliary_names\">Click to go back to the corresponding entry in the \"auxiliary names\" appendix</a>]"
					i.puts ""
				end
				i.puts "# <span id=\"#{counter}auxiliary\"></span>" + chomped_line
			else
				i.puts chomped_line
			end
		else
			i.puts chomped_line
			start = true if chomped_line.include?("The practices:")
		end
	end    
end