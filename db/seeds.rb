# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Url.find_or_create_by_url({"url"=>"http://feeds.nytimes.com/nyt/rss/HomePage", "topic"=>"NY Homepage", "notes"=>"NY Times main page"})
Url.find_or_create_by_url({"url"=>"http://rss.cnn.com/rss/cnn_topstories.rss", "topic"=>"CNN", "notes"=>"top news cnn"})
Url.find_or_creat_by_url({"url"=>"http://www.npr.org/rss/rss.php?id=1001", "topic"=>"NPR", "notes"=>"rss"})

