require 'pdf-reader-turtletext'
require 'pdf-reader'

pdf_filename = 'examplePDF.pdf'
reader = PDF::Reader::Turtletext.new(pdf_filename)
options = { :y_precision => 5 }
reader_with_options = PDF::Reader::Turtletext.new(pdf_filename,options)



# find x,y coordinate of specific date



# firstc stands for first column
firstc_text_by_exact_match = reader.text_position(/december 21/i, 1)

firstc_x = firstc_text_by_exact_match[:x]

# secondc stands for first column
secondc_text_by_exact_match = reader.text_position(/december 25/i, 1)

secondc_x = secondc_text_by_exact_match[:x]

# secondc stands for first column
thirdc_text_by_exact_match = reader.text_position(/december 13/i, 2)

thirdc_x = thirdc_text_by_exact_match[:x]

col_height = thirdc_text_by_exact_match[:y]

#~ puts text_by_exact_match[:y]

firstc_text1 = reader.text_in_region(
  firstc_x,   # minimum x (left-most)
  secondc_x,  # maximum x (right-most)
  1,  # minimum y (bottom-most)
  col_height, # maximum y (top-most)
  1,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)

firstc_text2 = reader.text_in_region(
  firstc_x,   # minimum x (left-most)
  secondc_x,  # maximum x (right-most)
  1,  # minimum y (bottom-most)
  col_height, # maximum y (top-most)
  2,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)

secondc_text1 = reader.text_in_region(
  secondc_x,   # minimum x (left-most)
  thirdc_x,  # maximum x (right-most)
  1,  # minimum y (bottom-most)
  col_height, # maximum y (top-most)
  1,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)


secondc_text2 = reader.text_in_region(
  secondc_x,   # minimum x (left-most)
  thirdc_x,  # maximum x (right-most)
  1,  # minimum y (bottom-most)
  col_height, # maximum y (top-most)
  2,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)

thirdc_text2 = reader.text_in_region(
  thirdc_x,   # minimum x (left-most)
  1000,  # maximum x (right-most)
  1,  # minimum y (bottom-most)
  col_height, # maximum y (top-most)
  2,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)


puts firstc_x, secondc_x

puts firstc_text1

puts firstc_text2

puts 'end first column'

puts secondc_text1

puts secondc_text2

puts 'end second column'

puts thirdc_text2
