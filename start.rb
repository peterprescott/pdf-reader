require 'pdf-reader-turtletext'

pdf_filename = 'examplePDF.pdf'
reader = PDF::Reader::Turtletext.new(pdf_filename)
options = { :y_precision => 5 }
reader_with_options = PDF::Reader::Turtletext.new(pdf_filename,options)

#~ text = reader.text_in_region(
  #~ 10,   # minimum x (left-most)
  #~ 900,  # maximum x (right-most)
  #~ 200,  # minimum y (bottom-most)
  #~ 400,  # maximum y (top-most)
  #~ 1,    # page (default 1)
  #~ false # inclusive of x/y position if true (default false)
#~ )

#~ puts text

# find x,y coordinate of specific date

text_by_exact_match = reader.text_position("December 22", 1)

puts text_by_exact_match.class
