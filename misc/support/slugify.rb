

File.open("w_culture.new.md", "w+") do |i|
	File.readlines("../../w_culture.md").each do |line|
		chomped_line = line.chomp!
		if chomped_line[0..8] == "# <a id=\""
			puts "yes!"
			puts chomped_line
			the_id = chomped_line.scan(/"([^"]*)"/)[0][0] #[1..-1] #.substring(1, chomped_line.length() - 1)
			puts the_id
			# https://stackoverflow.com/questions/9661478/how-to-return-the-substring-of-a-string-between-two-strings-in-ruby
			str1_markerstring = ">"
			str2_markerstring = "<"
			the_title = chomped_line[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
			puts the_title
			the_title_without_zws = the_title.gsub(/&#8203;/,"")
			slug_raw = the_title_without_zws.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
			if slug_raw.length > 50
				slug = slug_raw[0..50]
			else
				slug = slug_raw
			end
			i.puts("# <span id=\"#{the_id}\"></span><a id=\"#{slug}\" href=\"##{slug}\">#{the_title}</a>")
		else
			i.puts chomped_line
		end
	end    
end