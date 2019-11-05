require 'docsplit'
## http://documentcloud.github.io/docsplit/ (requires 'pdftotext.exe' from xpdf-utils or poppler-utils)
require 'fileutils'

def convert(file, marker)
    Docsplit.extract_text(File.join("pdfs",file), {pdf_opts: '-raw',  
     pages: 1..2, 
     output: 'working'})
    filename = file[0..-5]     
    join_pages(filename)
     
    flip_at_marker(filename, marker)
end

def join_pages(filename)

    output_filename = filename + '.txt'
    page1 = File.join('working',filename + '_1.txt')
    page2 = File.join('working',filename + '_2.txt')

    
    open(File.join('working',output_filename), 'w') { |f|
        
        page = File.open(page1, "r")
        while line = page.gets
            f.puts line
        end
        page.close

        page = File.open(page2, "r")
        while line = page.gets
            f.puts line
        end
        page.close
    }

        
    
end

def flip_at_marker(filename, marker)
    output_filename = filename + '.txt'

    switch = 0
    open(File.join('output',output_filename), 'w') { |f|
        
        # first run, check for marker and print from there
        page = File.open(File.join('working',output_filename), "r")
        while line = page.gets
            
            if switch == 0

              if line.downcase.include? marker.downcase
                switch = 1
              end
            end
            if switch == 1
              f.puts line
            end
        end
        page.close

        # second run, check for marker and stop printing there
        page = File.open(File.join('working',output_filename), "r")
        while line = page.gets
            if switch == 1
              f.puts line
              if line.downcase.include? marker.downcase
                switch = 0
              end
            end
        end
        page.close
    }
    
    # delete our 'working' mess
    FileUtils.rm_rf('working')
end


convert('1.pdf', 'December 2018')
convert('2.pdf', 'November 2019')
