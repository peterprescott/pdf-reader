require 'pdf-reader'

reader = PDF::Reader.new("examplePDF.pdf")


# write each page to a file
i = 1
reader.pages.each do |page|

	filename = "page#{i}.txt"
	open(filename, 'w') { |f|
		
		f.puts page.text
        
	}
	i = i + 1
end



open('ordered.txt', 'w') { |f|
	# start with the first column of the second page
	File.open("page2.txt", "r").each_line do |line|
		f.puts line[0..65]
	end
	# ... second column of second page
	File.open("page2.txt", "r").each_line do |line|
		f.puts line[64..130]
	end
	# ... third column of second page
	File.open("page2.txt", "r").each_line do |line|
		f.puts line[130..-1]
	end
	# ... then first column of first page
	File.open("page1.txt", "r").each_line do |line|
		f.puts line[0..65]
	end
	# ... finally second column of second page
	File.open("page1.txt", "r").each_line do |line|
		f.puts line[64..130]
	end
}



