
require 'zlib'
require 'fileutils'

class Unpacker

  @@default_settings = {
    :debug => false
  }

  def initialize(src, dest, opts={})
    @src = src
    @dest = dest
    @settings = @@default_settings.merge(opts)
  end

  def unpack!
    raise "Not implemented yet"
  end

  private
  def log(s)
    puts s if @settings[:debug]
  end

  def zlib_inflate(string)
    zstream = Zlib::Inflate.new
    buf = zstream.inflate(string)
    zstream.finish
    zstream.close
    buf
  end

end