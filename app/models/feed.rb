class Feed
  def self.stories
    $redis.keys.map do |key|
      if key.include?('headline')
        $redis.get(key)
      end
    end
  end
end