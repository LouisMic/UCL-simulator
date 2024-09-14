require 'rest-client'
require 'json'


# Creating Matchdays

# Matchday.create!(start_date: "2024-09-17", end_date: "2024-09-19")
# Matchday.create!(start_date: "2024-10-01", end_date: "2024-10-02")
# Matchday.create!(start_date: "2024-10-22", end_date: "2024-10-23")
# Matchday.create!(start_date: "2024-11-05", end_date: "2024-11-06")
# Matchday.create!(start_date: "2024-11-26", end_date: "2024-11-27")
# Matchday.create!(start_date: "2024-12-10", end_date: "2024-12-11")
# Matchday.create!(start_date: "2025-01-21", end_date: "2025-01-22")
# Matchday.create!(start_date: "2025-01-29", end_date: "2025-01-29")

# puts "Created #{Matchday.all.size} matchdays (should be 8)"



# Destroying all clubs and fixtures

# Game.destroy_all
# Club.destroy_all

# Creating all clubs and fixtures
# page1 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=1"
# page2 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=2"
# page3 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=3"
# page4 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=4"
# page5 = "https://livescore-api.com/api-client/fixtures/matches.json?key=#{ENV['key']}&secret=#{ENV['secret']}&competition_id=244&package_id=4&page=5"
# all_urls = [page1, page2, page3, page4, page5]


# all_urls.each do |url|
#   response = RestClient.get(url)
#   fixtures = JSON.parse(response)["data"]["fixtures"]

#   fixtures.each do |fixture|
#     home = Club.find_or_create_by(name: fixture["home_name"])
#     away = Club.find_or_create_by(name: fixture["away_name"])
#     matchday = Matchday.all[fixture["round"].to_i - 1]
#     Game.create!(matchday: matchday, home_team: home, away_team: away)
#   end
# end

# puts "Created #{Club.all.size} clubs (should be 36)"
# puts "Created #{Game.all.size} games (should be #{18 * 8})"

clubs = {
  "Arsenal" => "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
  "Barcelona" => "https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg",
  "Bayer Leverkusen" => "https://upload.wikimedia.org/wikipedia/en/5/59/Bayer_04_Leverkusen_logo.svg",
  "Juventus" => "https://upload.wikimedia.org/wikipedia/commons/4/4e/Juventus_FC_-_logo_black_%28Italy%2C_2017%29.svg",
  "Inter" => "https://upload.wikimedia.org/wikipedia/commons/0/05/FC_Internazionale_Milano_2021.svg",
  "Liverpool" => "https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg",
  "Manchester City" => "https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg",
  "PSV Eindhoven" => "https://upload.wikimedia.org/wikipedia/en/0/05/PSV_Eindhoven.svg",
  "RasenBallsport Leipzig" => "https://upload.wikimedia.org/wikipedia/en/0/04/RB_Leipzig_2014_logo.svg",
  "Real Madrid" => "https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg",
  "Shakhtar Donetsk" => "https://upload.wikimedia.org/wikipedia/fr/5/57/FC_Shakhtar_Donetsk_%28logo%29.svg",
  "Slovan Bratislava" => "https://upload.wikimedia.org/wikipedia/commons/0/01/SK_Slovan_Bratislava_logo.svg",
  "Young Boys" => "https://upload.wikimedia.org/wikipedia/fr/c/c2/BSC_Young_Boys.svg",
  "AC Milan" => "https://upload.wikimedia.org/wikipedia/commons/d/d0/Logo_of_AC_Milan.svg",
  "Aston Villa" => "https://upload.wikimedia.org/wikipedia/fr/1/14/Aston_Villa_FC_2024.svg",
  "Atalanta" => "https://upload.wikimedia.org/wikipedia/fr/f/fd/Logo_Atalanta_Bergame_2024.svg",
  "Atletico Madrid" => "https://upload.wikimedia.org/wikipedia/fr/f/fc/Logo_ATM_2024.svg",
  "Bayern Munich" => "https://upload.wikimedia.org/wikipedia/commons/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg",
  "Benfica" => "https://upload.wikimedia.org/wikipedia/fr/1/1c/Logo_SLB_2023.svg",
  "Bologna" => "https://upload.wikimedia.org/wikipedia/fr/f/fb/Logo_Bologna_FC_-_2018.svg",
  "Borussia Dortmund" => "https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg",
  "Brest" => "https://upload.wikimedia.org/wikipedia/fr/4/4c/Logo_SB29_2010.svg",
  "Club Brugge" => "https://upload.wikimedia.org/wikipedia/fr/f/fd/Club_Brugge_KV.svg",
  "Celtic" => "https://upload.wikimedia.org/wikipedia/fr/f/f2/Celtic_fc.svg",
  "Dinamo Zagreb" => "https://upload.wikimedia.org/wikipedia/fr/b/b2/GNK_Dinamo_Zagreb_Crest.png",
  "FK Crvena Zvezda" => "https://upload.wikimedia.org/wikipedia/commons/0/07/Grb-fk-crvena-zvezda.svg",
  "Feyenoord" => "https://upload.wikimedia.org/wikipedia/fr/2/24/Logo_Feyenoord_Rotterdam.svg",
  "Girona" => "https://upload.wikimedia.org/wikipedia/fr/5/56/Logo_Girona_FC_-_2022.svg",
  "Lille" => "https://upload.wikimedia.org/wikipedia/fr/6/62/Logo_LOSC_Lille_2018.svg",
  "Monaco" => "https://upload.wikimedia.org/wikipedia/fr/1/1d/Logo_AS_Monaco_FC_2021.svg",
  "Paris Saint Germain" => "https://upload.wikimedia.org/wikipedia/fr/8/86/Paris_Saint-Germain_Logo.svg",
  "Salzburg" => "https://upload.wikimedia.org/wikipedia/fr/b/be/Red_Bull_Salzburg_logo.svg",
  "Sparta Prague" => "https://upload.wikimedia.org/wikipedia/commons/d/dd/AC-Sparta-LOGO2021.svg",
  "Sporting CP" => "https://upload.wikimedia.org/wikipedia/fr/1/12/Logo_Sporting_Clube_Portugal.svg",
  "Sturm Graz" => "https://upload.wikimedia.org/wikipedia/fr/2/20/SK_Sturm_Graz_Logo.svg",
  "VfB Stuttgart" => "https://upload.wikimedia.org/wikipedia/commons/e/eb/VfB_Stuttgart_1893_Logo.svg",
}

clubs.each do |name, logo|
  Club.find_by(name: name).update!(logo: logo)
end
