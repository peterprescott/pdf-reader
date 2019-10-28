require 'pdf-reader'

reader = PDF::Reader.new("examplePDF.pdf")

#~ reader.pages.each do |page|
  #~ puts page.fonts
  #~ puts page.text
  #~ puts page.raw_content
#~ end

# open and write to a file with ruby
open('myfile.out', 'w') { |f|
	reader.pages.each do |page|
	  #~ puts page.fonts
	  #~ puts page.text
	  #~ lines = page.text.split('n')
	  #~ for line in lines do
		
        f.puts page.text
	  #~ end

	end
}

