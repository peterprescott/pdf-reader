require 'pdf-reader'

reader = PDF::Reader.new("examplePDF.pdf")

reader.pages.each do |page|
  #~ puts page.fonts
  puts page.text
  #~ puts page.raw_content
end

