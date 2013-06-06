require 'yaml'
require 'tilt'

links = []

Dir.glob('competitions/*.yml').each do |yaml|
  competition = YAML::load_file(yaml)

  basename = File.basename(yaml, File.extname(yaml))
  dirname = File.dirname(yaml)

  path = "#{dirname}/#{basename}.html"

  links << {:title => competition["title"],
            :path => path}
end

layout = Tilt.new('layout/base.haml')

links = links.sort do |a, b|
  a[:title] <=> b[:title]
end

output = layout.render do
  renderer = Tilt.new('layout/competition_list.haml')
  renderer.render self, :competitions => links
end

File.open("competitions.html", "w+b") do |f|
  f.write output
end
