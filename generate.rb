require 'yaml'
require 'tilt'

yaml = ARGV[0]

basename = File.basename(yaml, File.extname(yaml))
dirname = File.dirname(yaml)
competition = YAML::load_file(yaml)

layout = Tilt.new('layout/base.haml')

output = layout.render do
  renderer = Tilt.new('layout/competition.haml')
  renderer.render self, :competition => competition
end

File.open("#{dirname}/#{basename}.html", "w+b") do |f|
  f.write output
end

