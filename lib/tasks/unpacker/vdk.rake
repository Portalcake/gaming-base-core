load "#{File.dirname(__FILE__)}/unpacker.rake"

class VDKUnpacker < Unpacker

  def unpack!
    subfolder = File.basename(@src, ".VDK")
    @file = File.open(@src, "rb")

    @file.read(8) #vdk header
    @file.read(4)#dummy
    log "Found #{filecount = @file.read(4).unpack("l").first} files in archive"
    @file.seek(28) #dummy?

    while (e = read_header) && !@file.eof?
      if e[:file_type]==1
        read_directory(:dirname => "#{@dest}/#{subfolder}/#{e[:name]}", :offset=>e[:offset])
      else
        extract_file("#{@dest}/#{subfolder}", e)
      end
    end
  end

  private
  def read_header

    log "Filetype: #{filetype = @file.read(1).unpack("c").first} (0=file, 1=dir)"
    unless [0,1].include?(filetype)
      return nil
    end
    
    log "Name    : #{name = @file.read(128).gsub(/\x00*$/, '')}"
    log "Size    : #{size_uncompressed = @file.read(4).unpack("l").first} (uncompressed)"
    log "Size    : #{size_compressed = @file.read(4).unpack("l").first} (compressed)"
    log "Offset  : #{offset = @file.read(4).unpack("l").first} (empty on files)"
    log "NextFile: #{nextfile = @file.read(4).unpack("l").first} (empty on lastfile)"

    {
      :name => name,
      :file_type => filetype,
      :size_compressed => size_compressed,
      :size_uncompressed => size_uncompressed,
      :offset => offset,
      :nextfile => nextfile
    }

  end

  def read_directory(opts)

    lastpos = @file.pos if @file.pos != opts[:offset]
    FileUtils.mkdir_p(opts[:dirname])

    begin
      e = read_header
      return nil unless e
      next if [".", ".."].include? e[:name]
      if e[:file_type]==1
        read_directory(:dirname => "#{opts[:dirname]}/#{e[:name]}", :offset=>e[:offset])
        next
      end

      extract_file(opts[:dirname], e)

    end while e[:nextfile]>0

    @file.seek(lastpos) if lastpos
  end

  def extract_file(dirname, opts)
      begin
        File.open("#{dirname}/#{opts[:name]}", "wb") do |f|
          f.write(zlib_inflate(@file.read(opts[:size_compressed])))
          puts "#{dirname}/#{opts[:name]}"
        end
      rescue Zlib::DataError, Zlib::BufError
        log "Error extracting #{dirname}/#{opts[:name]}: #{$!}"
      rescue
        log dirname
        log opts
        raise
      end
  end
end