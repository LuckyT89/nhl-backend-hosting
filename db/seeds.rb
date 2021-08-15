# cvs is built into Ruby and lets you work with .csv files
require 'csv'

Team.destroy_all

#Create all 31 teams- https://www.sportslogos.net/teams/list_by_league/1/National_Hockey_League/NHL/logos/
Team.create(name: "Anaheim Ducks", image_url: "https://content.sportslogos.net/logos/1/1736/thumbs/173616512014.gif")
Team.create(name: "Arizona Coyotes", image_url: "https://content.sportslogos.net/logos/1/5263/thumbs/526378072015.gif")
Team.create(name: "Boston Bruins", image_url: "https://content.sportslogos.net/logos/1/3/thumbs/venf9fmhgnsawnxxvehf.gif")
Team.create(name: "Buffalo Sabres", image_url: "https://content.sportslogos.net/logos/1/4/thumbs/454932021.gif")
Team.create(name: "Calgary Flames", image_url: "https://content.sportslogos.net/logos/1/5/thumbs/548202021.gif")
Team.create(name: "Carolina Hurricanes", image_url: "https://content.sportslogos.net/logos/1/6/thumbs/fotih31tn5r345nufo5xxayh3.gif")
Team.create(name: "Chicago Blackhawks", image_url: "https://content.sportslogos.net/logos/1/7/thumbs/56.gif")
Team.create(name: "Colorado Avalanche", image_url: "https://content.sportslogos.net/logos/1/8/thumbs/64.gif")
Team.create(name: "Columbus Blue Jackets", image_url: "https://content.sportslogos.net/logos/1/9/thumbs/jhepegs329pc7ugyypebl28wg.gif")
Team.create(name: "Dallas Stars", image_url: "https://content.sportslogos.net/logos/1/10/thumbs/1079172014.gif")
Team.create(name: "Detroit Red Wings", image_url: "https://content.sportslogos.net/logos/1/11/thumbs/yo3wysbjtagzmwj37tb11u0fh.gif")
Team.create(name: "Edmonton Oilers", image_url: "https://content.sportslogos.net/logos/1/12/thumbs/1227282018.gif")
Team.create(name: "Florida Panthers", image_url: "https://content.sportslogos.net/logos/1/13/thumbs/1380782017.gif")
Team.create(name: "Los Angeles Kings", image_url: "https://content.sportslogos.net/logos/1/14/thumbs/1422202020.gif")
Team.create(name: "Minnesota Wild", image_url: "https://content.sportslogos.net/logos/1/15/thumbs/1588102014.gif")
Team.create(name: "Montréal Canadiens", image_url: "https://content.sportslogos.net/logos/1/16/thumbs/124.gif")
Team.create(name: "Nashville Predators", image_url: "https://content.sportslogos.net/logos/1/17/thumbs/lvchw3qfsun2e7oc02kh2zxb6.gif")
Team.create(name: "New Jersey Devils", image_url: "https://content.sportslogos.net/logos/1/18/thumbs/32tfs723a3bes0p0hb4hgcy1u.gif")
Team.create(name: "New York Islanders", image_url: "https://content.sportslogos.net/logos/1/19/thumbs/1939112018.gif")
Team.create(name: "New York Rangers", image_url: "https://content.sportslogos.net/logos/1/20/thumbs/144.gif")
Team.create(name: "Ottawa Senators", image_url: "https://content.sportslogos.net/logos/1/21/thumbs/2111292021.gif")
Team.create(name: "Philadelphia Flyers", image_url: "https://content.sportslogos.net/logos/1/22/thumbs/161.gif")
Team.create(name: "Pittsburgh Penguins", image_url: "https://content.sportslogos.net/logos/1/24/thumbs/2463622017.gif")
Team.create(name: "San Jose Sharks", image_url: "https://content.sportslogos.net/logos/1/26/thumbs/dmo1xf3z4pph27vmg3gf.gif")
Team.create(name: "St. Louis Blues", image_url: "https://content.sportslogos.net/logos/1/25/thumbs/187.gif")
Team.create(name: "Tampa Bay Lightning", image_url: "https://content.sportslogos.net/logos/1/27/thumbs/97hhvk8e5if0riesnex30etgz.gif")
Team.create(name: "Toronto Maple Leafs", image_url: "https://content.sportslogos.net/logos/1/28/thumbs/2887612017.gif")
Team.create(name: "Vancouver Canucks", image_url: "https://content.sportslogos.net/logos/1/29/thumbs/2920842020.gif")
Team.create(name: "Vegas Golden Knights", image_url: "https://content.sportslogos.net/logos/1/6114/thumbs/611426842018.gif")
Team.create(name: "Washington Capitals", image_url: "https://content.sportslogos.net/logos/1/30/thumbs/llrs2zxi127vkqgcsvfb.gif")
Team.create(name: "Winnipeg Jets", image_url: "https://content.sportslogos.net/logos/1/3050/thumbs/z9qyy9xqoxfjn0njxgzoy2rwk.gif")


Player.destroy_all

# p1 = Player.create(
#     number: 20,
#     name: "Capitals player 1",
#     position: "D",
#     age: 23,
#     height: "6'0",
#     weight: 200,
#     image_url: "something.com",
#     team_id: 1
# )

# p2 = Player.create(
#     number: 22,
#     name: "Capitals player 2",
#     position: "LW",
#     age: 33,
#     height: "6'1",
#     weight: 210,
#     image_url: "something.com",
#     team_id: 1
# )

# p3 = Player.create(
#     number: 33,
#     name: "Capitals player 3",
#     position: "C",
#     age: 24,
#     height: "5'2\"",
#     weight: 180,
#     image_url: "something.com",
#     team_id: 1
# )

# Helper method to clean up names
def updateName(name)
    name_array = name.split("\\")
    return name_array[0]
end

# Helper method to clean up heights
def updateHeight(height)
    height_array = height.split("-")
    feet = height_array[0]
    inches = height_array[1]
    return "#{feet}' #{inches}\""
end


ducksPlayers = []
CSV.foreach("1-ducks.csv") do |row|
    ducksPlayers << row
end
ducksPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 1
    )
end


coyotesPlayers = []
CSV.foreach("2-coyotes.csv") do |row|
    coyotesPlayers << row
end
coyotesPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 2
    )
end


bruinsPlayers = []
CSV.foreach("3-bruins.csv") do |row|
    bruinsPlayers << row
end
bruinsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 3
    )
end


sabresPlayers = []
CSV.foreach("4-sabres.csv") do |row|
    sabresPlayers << row
end
sabresPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 4
    )
end


flamesPlayers = []
CSV.foreach("5-flames.csv") do |row|
    flamesPlayers << row
end
flamesPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 5
    )
end


hurricanesPlayers = []
CSV.foreach("6-hurricanes.csv") do |row|
    hurricanesPlayers << row
end
hurricanesPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 6
    )
end


blackhawkPlayers = []
CSV.foreach("7-blackhawks.csv") do |row|
    blackhawkPlayers << row
end
blackhawkPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 7
    )
end


avalanchePlayers = []
CSV.foreach("8-avalanche.csv") do |row|
    avalanchePlayers << row
end
avalanchePlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 8
    )
end


bluejacketsPlayers = []
CSV.foreach("9-bluejackets.csv") do |row|
    bluejacketsPlayers << row
end
bluejacketsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 9
    )
end


starsPlayers = []
CSV.foreach("10-stars.csv") do |row|
    starsPlayers << row
end
starsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 10
    )
end


redwingsPlayers = []
CSV.foreach("11-redwings.csv") do |row|
    redwingsPlayers << row
end
redwingsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 11
    )
end


oilersPlayers = []
CSV.foreach("12-oilers.csv") do |row|
    oilersPlayers << row
end
oilersPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 12
    )
end


panthersPlayers = []
CSV.foreach("13-panthers.csv") do |row|
    panthersPlayers << row
end
panthersPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 13
    )
end


kingsPlayers = []
CSV.foreach("14-kings.csv") do |row|
    kingsPlayers << row
end
kingsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 14
    )
end


wildPlayers = []
CSV.foreach("15-wild.csv") do |row|
    wildPlayers << row
end
wildPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 15
    )
end


canadiensPlayers = []
CSV.foreach("16-canadiens.csv") do |row|
    canadiensPlayers << row
end
canadiensPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 16
    )
end


predatorsPlayers = []
CSV.foreach("17-predators.csv") do |row|
    predatorsPlayers << row
end
predatorsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 17
    )
end


devilsPlayers = []
CSV.foreach("18-devils.csv") do |row|
    devilsPlayers << row
end
devilsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 18
    )
end


islandersPlayers = []
CSV.foreach("19-islanders.csv") do |row|
    islandersPlayers << row
end
islandersPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 19
    )
end


rangersPlayers = []
CSV.foreach("20-rangers.csv") do |row|
    rangersPlayers << row
end
rangersPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 20
    )
end


senatorsPlayers = []
CSV.foreach("21-senators.csv") do |row|
    senatorsPlayers << row
end
senatorsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 21
    )
end


flyersPlayers = []
CSV.foreach("22-flyers.csv") do |row|
    flyersPlayers << row
end
flyersPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 22
    )
end


penguinsPlayers = []
CSV.foreach("23-penguins.csv") do |row|
    penguinsPlayers << row
end
penguinsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 23
    )
end


sharksPlayers = []
CSV.foreach("24-sharks.csv") do |row|
    sharksPlayers << row
end
sharksPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 24
    )
end


bluesPlayers = []
CSV.foreach("25-blues.csv") do |row|
    bluesPlayers << row
end
bluesPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 25
    )
end


lightningPlayers = []
CSV.foreach("26-lightning.csv") do |row|
    lightningPlayers << row
end
lightningPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 26
    )
end


mapleleafPlayers = []
CSV.foreach("27-mapleleafs.csv") do |row|
    mapleleafPlayers << row
end
mapleleafPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 27
    )
end


canucksPlayers = []
CSV.foreach("28-canucks.csv") do |row|
    canucksPlayers << row
end
canucksPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 28
    )
end


goldenknightsPlayers = []
CSV.foreach("29-goldenknights.csv") do |row|
    goldenknightsPlayers << row
end
goldenknightsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 29
    )
end


capitalsPlayers = []
CSV.foreach("30-capitals.csv") do |row|
    capitalsPlayers << row
end
capitalsPlayers.each do |player|
    Player.create(
        number: player[0],
        name: updateName(player[1]),
        position: player[2],
        age: player[3],
        height: updateHeight(player[4]),
        weight: player[5],
        image_url: player[6],
        team_id: 30
    )
end



