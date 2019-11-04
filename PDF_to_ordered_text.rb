require 'pdf-reader'



def page_to_text(file)
    reader = PDF::Reader.new(File.join("pdfs",file))

    # write each page to a file
    i = 1
    reader.pages.each do |page|

        filename = "page#{i}.txt"
        open(filename, 'w') { |f|
            
            f.puts page.text
            
        }
        i = i + 1
    end

end

def order_pdf(file)
    reader = PDF::Reader.new(File.join("pdfs",file))

    # write each page to a file
    i = 1
    reader.pages.each do |page|

        filename = "page#{i}.txt"
        open(filename, 'w') { |f|
            
            f.puts page.text
            
        }
        i = i + 1
    end

    output_filename = file[0..-5] + '_reordered' + '.txt'

    open(File.join('output',output_filename), 'w') { |f|
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
end

# order_pdf("1.pdf")
page_to_text("2.pdf")


