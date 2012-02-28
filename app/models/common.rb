module Common
  module Facebook
    def setup_facebook
      @access_token = session["fb_access_token"]
      @graph = Koala::Facebook::GraphAPI.new(@access_token)
      @profile = @graph.get_connections("me", "feed")
    end
  end
  module Youtube
    def process_facebook_messages
      setup_facebook
      @messages = @profile.reject{|f| f["message"].blank?}.map{|f| f["message"]}
    end
  end
end