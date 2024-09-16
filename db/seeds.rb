require 'rest-client'
require 'json'


## Creating Matchdays

# Matchday.create!(start_date: "2024-09-17", end_date: "2024-09-19")
# Matchday.create!(start_date: "2024-10-01", end_date: "2024-10-02")
# Matchday.create!(start_date: "2024-10-22", end_date: "2024-10-23")
# Matchday.create!(start_date: "2024-11-05", end_date: "2024-11-06")
# Matchday.create!(start_date: "2024-11-26", end_date: "2024-11-27")
# Matchday.create!(start_date: "2024-12-10", end_date: "2024-12-11")
# Matchday.create!(start_date: "2025-01-21", end_date: "2025-01-22")
# Matchday.create!(start_date: "2025-01-29", end_date: "2025-01-29")

# puts "Created #{Matchday.all.size} matchdays (should be 8)"



## Destroying all clubs and fixtures

# Game.destroy_all
# Club.destroy_all

# # Creating all clubs and fixtures
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
#     time = "#{fixture["date"]} #{fixture["time"]}"
#     date = DateTime.parse(time)
#     Game.create!(matchday: matchday, home_team: home, away_team: away, gametime: date)
#   end
# end

# puts "Created #{Club.all.size} clubs (should be 36)"
# puts "Created #{Game.all.size} games (should be #{18 * 8})"

## Updating clubs with logos countries and coeffs

# clubs = {
#   "Arsenal" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
#     country: "England",
#     coeff_full: 62,
#     coeff_last: 22
#   },
#   "Barcelona" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg",
#     country: "Spain",
#     coeff_full: 67,
#     coeff_last: 23
#   },
#   "Bayer Leverkusen" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/5/59/Bayer_04_Leverkusen_logo.svg",
#     country: "Germany",
#     coeff_full: 72,
#     coeff_last: 29
#   },
#   "Juventus" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/4/4e/Juventus_FC_-_logo_black_%28Italy%2C_2017%29.svg",
#     country: "Italy",
#     coeff_full: 58,
#     coeff_last: 0
#   },
#   "Inter" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/0/05/FC_Internazionale_Milano_2021.svg",
#     country: "Italy",
#     coeff_full: 76,
#     coeff_last: 20
#   },
#   "Liverpool" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg",
#     country: "England",
#     coeff_full: 96,
#     coeff_last: 20
#   },
#   "Manchester City" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg",
#     country: "England",
#     coeff_full: 123,
#     coeff_last: 28
#   },
#   "PSV Eindhoven" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/0/05/PSV_Eindhoven.svg",
#     country: "Netherlands",
#     coeff_full: 48,
#     coeff_last: 17
#   },
#   "RasenBallsport Leipzig" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/0/04/RB_Leipzig_2014_logo.svg",
#     country: "Germany",
#     coeff_full: 70,
#     coeff_last: 18
#   },
#   "Real Madrid" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg",
#     country: "Spain",
#     coeff_full: 119,
#     coeff_last: 34
#   },
#   "Shakhtar Donetsk" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/5/57/FC_Shakhtar_Donetsk_%28logo%29.svg",
#     country: "Ukraine",
#     coeff_full: 41,
#     coeff_last: 10
#   },
#   "Slovan Bratislava" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/0/01/SK_Slovan_Bratislava_logo.svg",
#     country: "Slovakia",
#     coeff_full: 27.5,
#     coeff_last: 8
#   },
#   "Young Boys" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/c/c2/BSC_Young_Boys.svg",
#     country: "Switzerland",
#     coeff_full: 28.5,
#     coeff_last: 7
#   },
#   "AC Milan" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Logo_of_AC_Milan.svg",
#     country: "Italy",
#     coeff_full: 59,
#     coeff_last: 16
#   },
#   "Aston Villa" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/1/14/Aston_Villa_FC_2024.svg",
#     country: "England",
#     coeff_full: 17,
#     coeff_last: 17
#   },
#   "Atalanta" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/f/fd/Logo_Atalanta_Bergame_2024.svg",
#     country: "Italy",
#     coeff_full: 61,
#     coeff_last: 28
#   },
#   "Atletico Madrid" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/f/fc/Logo_ATM_2024.svg",
#     country: "Spain",
#     coeff_full: 67,
#     coeff_last: 24
#   },
#   "Bayern Munich" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg",
#     country: "Germany",
#     coeff_full: 108,
#     coeff_last: 28
#   },
#   "Benfica" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/1/1c/Logo_SLB_2023.svg",
#     country: "Portugal",
#     coeff_full: 69,
#     coeff_last: 14
#   },
#   "Bologna" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/f/fb/Logo_Bologna_FC_-_2018.svg",
#     country: "Italy",
#     coeff_full: 0,
#     coeff_last: 0
#   },
#   "Borussia Dortmund" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg",
#     country: "Germany",
#     coeff_full: 79,
#     coeff_last: 29
#   },
#   "Brest" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/4/4c/Logo_SB29_2010.svg",
#     country: "France",
#     coeff_full: 0,
#     coeff_last: 0
#   },
#   "Club Brugge" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/f/fd/Club_Brugge_KV.svg",
#     country: "Belgium",
#     coeff_full: 56,
#     coeff_last: 21
#   },
#   "Celtic" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/f/f2/Celtic_fc.svg",
#     country: "Scotland",
#     coeff_full: 22,
#     coeff_last: 7
#   },
#   "Dinamo Zagreb" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/b/b2/GNK_Dinamo_Zagreb_Crest.png",
#     country: "Croatia",
#     coeff_full: 42,
#     coeff_last: 9
#   },
#   "FK Crvena Zvezda" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/0/07/Grb-fk-crvena-zvezda.svg",
#     country: "Serbia",
#     coeff_full: 34,
#     coeff_last: 5
#   },
#   "Feyenoord" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/2/24/Logo_Feyenoord_Rotterdam.svg",
#     country: "Netherlands",
#     coeff_full: 53,
#     coeff_last: 8
#   },
#   "Girona" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/5/56/Logo_Girona_FC_-_2022.svg",
#     country: "Spain",
#     coeff_full: 0,
#     coeff_last: 0
#   },
#   "Lille" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/6/62/Logo_LOSC_Lille_2018.svg",
#     country: "France",
#     coeff_full: 42,
#     coeff_last: 17
#   },
#   "Monaco" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/1/1d/Logo_AS_Monaco_FC_2021.svg",
#     country: "France",
#     coeff_full: 24,
#     coeff_last: 0
#   },
#   "Paris Saint Germain" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/8/86/Paris_Saint-Germain_Logo.svg",
#     country: "France",
#     coeff_full: 85,
#     coeff_last: 23
#   },
#   "Salzburg" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/b/be/Red_Bull_Salzburg_logo.svg",
#     country: "Austria",
#     coeff_full: 40,
#     coeff_last: 7
#   },
#   "Sparta Prague" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/d/dd/AC-Sparta-LOGO2021.svg",
#     country: "Czech Republic",
#     coeff_full: 20.5,
#     coeff_last: 10
#   },
#   "Sporting CP" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/1/12/Logo_Sporting_Clube_Portugal.svg",
#     country: "Portugal",
#     coeff_full: 44.5,
#     coeff_last: 12
#   },
#   "Sturm Graz" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/fr/2/20/SK_Sturm_Graz_Logo.svg",
#     country: "Austria",
#     coeff_full: 13,
#     coeff_last: 4
#   },
#   "VfB Stuttgart" =>
#   { logo: "https://upload.wikimedia.org/wikipedia/commons/e/eb/VfB_Stuttgart_1893_Logo.svg",
#     country: "Germany",
#     coeff_full: 0,
#     coeff_last: 0
#   },
#  }

# clubs.each do |key, value|
#   Club.find_by(name: key).update!(logo: value[:logo], country: value[:country], coeff_full: value[:coeff_full], coeff_last: value[:coeff_last])
# end
#
#
# # Updating RB Leipzig

# if Club.find_by(name: "RasenBallsport Leipzig")
#   Club.find_by(name: "RasenBallsport Leipzig").update!(name: "RB Leipzig")
# else
#   Club.find_by(name: "RB Leipzig").update!(name: "RasenBallsport Leipzig")
# end
