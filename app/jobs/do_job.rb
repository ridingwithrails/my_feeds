require 'net/http'
require 'uri'

class DoJob
  @queue = :test_q
    
  def self.perform(dom=nil)
    str = http.get URI.parse( "#{dom ||'http://www.yahoo.com'}")
    $redis.set(Time.now.to_s, str)
  end
  
  def self.http
    @http ||= Net::HTTP
  end 
end