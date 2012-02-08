require 'net/http'
require 'uri'
class Url < ActiveRecord::Base
  def get_page(dom=nil)
    str = http.get URI.parse( "#{dom ||'http://www.yahoo.com'}")
    $redis.set(Time.now.to_s, str)
  end
  
  def http
    @http ||= Net::HTTP
  end  
end