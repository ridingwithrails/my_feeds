# Load the rails application
require File.expand_path('../application', __FILE__)
config = YAML::load(File.open("#{Rails.root}/config/external_sites.yml"))
GOOGLE_KEY = config["google"]["key"]

# Initialize the rails application
RedistTest::Application.initialize!
