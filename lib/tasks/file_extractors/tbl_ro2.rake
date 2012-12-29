# encoding: utf-8

# Fileinfo *.tbl
#
# Simple cvs based file encoded in UTF-16LE and seperated with tabs (\t)
# First line holds the header, subsequent rows the data
# 
# However, as the files contains typos with \\n and \n,
# we need to make sure that the columns are read fully everytime
# 


load "#{File.dirname(__FILE__)}/file_extractor.rake"

class FileExtractor_tbl < FileExtractor

  private

  def analyze
    @file.read(2) #dummy
    lines = @file.read.split("\x0A\x00")
    #header must be on one line.. would be horrible if not
    @header = lines.shift.chomp.encode('UTF-8', 'UTF-16LE').split("\t").map(&:chomp)

    cells = []
    while line = lines.shift
      line = line.encode('UTF-8', 'UTF-16LE')

      unless cells.empty?
        #found a typo, last value is broken over two lines, need to be concatenated
        line = cells.last + line
        cells.pop
      end

      #values specified as "0" are nil-values
      cells << line.split("\t").map(&:chomp).collect{|value| value=="0" ? nil : value}
      cells.flatten!
      case cells.length <=> @header.length
      when 0
        @data << cells
        cells = []
      when 1
        raise "There is something terrible wrong with this tbl... #{cells}"
      end
    end
  end

end