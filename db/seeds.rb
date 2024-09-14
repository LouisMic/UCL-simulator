require 'rest-client'
require 'json'


# Creating Matchdays

Matchday.create!(start_date: "2024-09-17", end_date: "2024-09-19")
Matchday.create!(start_date: "2024-10-01", end_date: "2024-10-02")
Matchday.create!(start_date: "2024-10-22", end_date: "2024-10-23")
Matchday.create!(start_date: "2024-11-05", end_date: "2024-11-06")
Matchday.create!(start_date: "2024-11-26", end_date: "2024-11-27")
Matchday.create!(start_date: "2024-12-10", end_date: "2024-12-11")
Matchday.create!(start_date: "2025-01-21", end_date: "2025-01-22")
Matchday.create!(start_date: "2025-01-29", end_date: "2025-01-29")

puts "Created #{Matchday.all.size} matchdays (should be 8)"



# Destroying all clubs and fixtures

# Game.destroy_all
# Club.destroy_all

# Creating all clubs and fixtures
page1 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=1"
page2 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=2"
page3 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=3"
page4 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=4"
page5 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=5"
all_urls = [page1, page2, page3, page4, page5]


all_urls.each do |url|
  response = RestClient.get(url)
  fixtures = JSON.parse(response)["data"]["fixtures"]

  fixtures.each do |fixture|
    home = Club.find_or_create_by(name: fixture["home_name"])
    away = Club.find_or_create_by(name: fixture["away_name"])
    matchday = Matchday.all[fixture["round"].to_i - 1]
    Game.create!(matchday: matchday, home_team: home, away_team: away)
  end
end

puts "Created #{Club.all.size} clubs (should be 36)"
puts "Created #{Game.all.size} games (should be #{18 * 8})"
