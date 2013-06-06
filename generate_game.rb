require 'tilt'
require 'yaml'

competition = "competitions/#{ARGV[0]}.yml"
game = ARGV[1]

competition = YAML::load_file(competition)

game = competition["games"].select {|x| x["slug"] == game }.first

p game

layout = Tilt.new('layout/base.haml')

output = layout.render do
  renderer = Tilt.new('layout/game.haml')
  renderer.render self, :game => game
end

File.open("games/#{competition["slug"]}-#{game["slug"]}.html", "w+b") do |f|
  f.write output
end

