module BarcodesHelper
  def format(v, n)
    return '' if v == nil


    if v.class.to_s == 'String' then
      txt = v.to_s
      return txt if txt.encoding.to_s == 'UTF-8'
      return txt.encode('UTF-8') if txt.encoding.to_s == 'US-ASCII'
      debugger
      puts "unknown encoding: " + txt.encoding.to_s
    else
      return v.to_s
      #for debug only
      if !['Fixnum', 'BigDecimal', 'Float', 'TrueClass', 'FalseClass', 'ActiveSupport::TimeWithZone'].include?(v.class.to_s)
        puts "unknown class: " + v.class
      end
    end
  end
end
