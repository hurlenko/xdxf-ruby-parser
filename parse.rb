require 'nokogiri'

dict_path = "dict.xdxf"
file_path = "out.csv"
arr = []
doc = Nokogiri::XML(File.open(dict_path))
file = File.open(file_path, "w")
doc.xpath('//ar').each do |thing|
	word = thing.children.children.text
	translation = thing.children[1].text.delete!("\n\"").split(" ")[1]
	arr << [word, translation]
end
arr.uniq! { |s| s.first }
arr.each{ |word|
	file.puts "#{word[0]};#{word[1]}"
 }