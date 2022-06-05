#  rb processing2.rb

# from:
# # <span id="109"></span> p10 [experimental]:
# to: 
# # <a id="108" href="#108">p9:</a>

skip = 0
File.open("index.new.md", "w+") do |i|
	File.readlines("../../index.md").each do |line|
		chomped_line = line.chomp!
		if chomped_line.include?("span id=")
			#if skip<5 then
			#	skip += 1
			#	next
			#end
			if chomped_line[-1]!=":"
				i.puts chomped_line
				next
			end
			puts "yes!"
			puts chomped_line
			the_id = chomped_line.scan(/"([^"]*)"/)[0][0] #[1..-1] #.substring(1, chomped_line.length() - 1)
			puts the_id
			# https://stackoverflow.com/questions/9661478/how-to-return-the-substring-of-a-string-between-two-strings-in-ruby
			str1_markerstring = "</span> "
			str2_markerstring = ":"
			the_title = chomped_line[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
			puts the_title
			i.puts("# <a id=\"#{the_id}\" href=\"##{the_id}\">#{the_title}:</a>")
		else
			i.puts chomped_line
		end
	end    
end


