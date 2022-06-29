
#slugify toc's

fromr = ["index.md", "w_culture.md", "auxiliary_names.md"]
tor = ["index.new.md", "w_culture.new.md", "auxiliary_names.new.md"]

#fromr = []
#tor = []
#fromr[0] = "auxiliary_names.md" 
#tor[0] = "auxiliary_names.new.md"

(0..2).each do |n|
	File.open(tor[n], "w+") do |i|
		File.readlines("../../#{fromr[n]}").each do |line|
			chomped_line = line.chomp!
			if chomped_line == "" || chomped_line.nil?
				i.puts chomped_line
				next
			end
			if ((chomped_line.include?("h\" href") || chomped_line.include?("q\" href")) || chomped_line.include?("auxiliary_names\" href")) && !chomped_line.include?("</span>")
				puts "yes!"
				puts chomped_line
				pre_index = chomped_line.index("<")
				the_id = chomped_line.scan(/"([^"]*)"/)[0][0] #[1..-1] #.substring(1, chomped_line.length() - 1)
				puts the_id
				# https://stackoverflow.com/questions/9661478/how-to-return-the-substring-of-a-string-between-two-strings-in-ruby
				str1_markerstring = "\">"
				str2_markerstring = "</a>"
				the_title = chomped_line[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
				puts "the_title: " + the_title

				the_title_without_zws = the_title.gsub(/&#8203;/,"")
	            slug_raw = the_title_without_zws.downcase.gsub(/[^a-z0-9]+/, '-').chomp('-')
	            if slug_raw.length > 50
	                    slug = slug_raw[0..50]
	            else
	                    slug = slug_raw
	            end

				i.puts(chomped_line[0..pre_index-1]+"<a id=\"#{the_id}\" href=\"##{slug}\">#{the_title}</a>")
			else
				i.puts chomped_line
			end
		end    
	end
end