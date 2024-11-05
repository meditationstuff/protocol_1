start = false
at_least_one = false
done = false
counter = 0
File.open("auxiliary_names.md.new", "w+") do |i|
	File.readlines("auxiliary_names.md").each do |line|
		chomped_line = line.chomp.strip
		if start
			if chomped_line == ""
				i.puts ""
				done = true if at_least_one
				next
			end
			counter += 1
			at_least_one = true
			if !done
				i.puts "* <a id=\"#{counter}auxiliary_names\" href=\"##{counter}auxiliary\">" + chomped_line + "</a>"
			else
				i.puts chomped_line
			end
		else	
			i.puts chomped_line
			start = true if chomped_line.include?("The list:")
		end
	end    
end