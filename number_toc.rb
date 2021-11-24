# adds numbering to table of contents and section headers
# (kludgy, inelegant first pass, possibly not operating at
# right stage of the pipeline. there might be a better thing,
# such as a provided option in a tool or a library)

# if this were used, index2.html should be substituted for
# index.html in m.sh, making sure that all enclosing scripts
# fail if this script fails.

# limitations: 
# 1. does not go tag by tag,
# so if too much is on one line then this will fail.
# 2. finds number insertion point in a kludgy way.
# 3. not obviously safe/bug-free in terms of not accidentally
# dropping content, and risk of regression grows if further
# modifications

prefix_hash = {}

prefix_stack = []
counter_stack = []
in_toc = false
after_toc = false
in_back_matter = false

prefix = ""
counter = 0

skip_strings = [
  "bibliography (incomplete)",
  "appendix 1: preliminary/auxiliary practices (names only)",
  "appendix 2: preliminary/auxiliary practices (full)",
  'appendix 3: main practice p1 appendix (usa english; "en-us")'
]

# https://stackoverflow.com/questions/9661478/how-to-return-the-substring-of-a-string-between-two-strings-in-ruby
class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

def hash_title(title) #not really hashing; normalize, maybe
  title.gsub(/[^0-9A-Za-z\s]/, '')
end

def skippable(line)
    return true if line.include?("<li>") && line.include?("bibliography")
    return true if line.include?("<li>") && line.include?("appendix")
    return true if line.include?("<h1>") && line.include?("bibliography")
    return true if line.include?("<h1>") && line.include?("appendix")
    false
end

File.open("index2.html", "w") do |file_to_write|
  File.open("index.html").each do |line|
    chomped_line = line.chomp
    
    if chomped_line.include?("<h1>") && (chomped_line.include?("appendix") || chomped_line.include?("bibliography"))
      in_back_matter = true
    end
    if in_back_matter
      file_to_write.write(chomped_line)
      next
    end
    if chomped_line.include?("<h1>") && chomped_line.include?("Full Table of Contents")
      in_toc = true
      file_to_write.write(chomped_line)
      next
    end
    if skippable(chomped_line)
      file_to_write.write(chomped_line)
      next
    end
    if !in_toc && !after_toc
      file_to_write.write(chomped_line)
      next
    end
    if chomped_line.include?("<h1>") && in_toc && !after_toc
      in_toc = false
      after_toc = true
    end

    if in_toc
      if chomped_line.include?("<ul>")
        prefix_stack.push(prefix)
        counter_stack.push(counter)
        if prefix == ""
          prefix = counter.to_s
        else
          prefix = prefix + "." + counter.to_s
        end
        counter = 0
      end
      if chomped_line.include?("</ul>")
        prefix = prefix_stack.pop
        counter = counter_stack.pop
      end
      idx = chomped_line.index('">')
      if idx.nil?
        file_to_write.write(chomped_line)
        next
      end
      
      counter += 1
      title = chomped_line.string_between_markers('">',"</a>")
      full_prefix = prefix + "." + counter.to_s + ". "
      prefix_hash[hash_title(title)] = full_prefix
      idx = chomped_line.index("<a")
      puts full_prefix
      chomped_line.insert(idx,full_prefix[2..-1])
      file_to_write.write(chomped_line)
    end

    if after_toc
      if chomped_line.include?("<h1>")
        title = chomped_line.string_between_markers("</span> ",":</h1>")
        idx = chomped_line.index('</span> ') #assumes a space after tag!
        puts prefix_hash[hash_title(title)]
        chomped_line.insert(idx+8,prefix_hash[hash_title(title)][2..-1])
        file_to_write.write(chomped_line)
      else
        file_to_write.write(chomped_line)
      end
    end

  end
end

