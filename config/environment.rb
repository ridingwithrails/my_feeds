# Load the rails application
require File.expand_path('../application', __FILE__)
config = YAML::load(File.open("#{Rails.root}/config/external_sites.yml"))
GOOGLE_KEY = config["google"]["key"]

FACEBOOK_KEY = config["facebook"]["app_id"]
FACEBOOK_SECRET = config["facebook"]["app_secret"]


# Initialize the rails application
RedistTest::Application.initialize!
=begin
@oauth =    Koala::Facebook::OAuth.new(FACEBOOK_KEY,FACEBOOK_SECRET, localhost:3000)
access_token = @oauth.get_app_access_token
 @graph = Koala::Facebook::API.new(access_token)
@graph.search(nil, {:name => "Bar Food", :type => "place"})
=end