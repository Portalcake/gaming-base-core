class FileExtractor
  @@default_settings = {
    :debug => false
  }

  attr_reader :data, :header

  def initialize(filepath, opts={})
    @filepath = filepath
    @settings = @@default_settings.merge(opts)
    @data = []

    @file = File.open(filepath, "rb")
    analyze
    @file.close
  end

  def log(s)
    #return unless !s.scan(/:\s1540(\s|$)/i).empty? && @settings[:debug]
    #puts "#{@filepath} #{s}"
    puts s if @settings[:debug]
  end

  private
  def analyze
    raise "Stub: Not implemented yet"
  end
end