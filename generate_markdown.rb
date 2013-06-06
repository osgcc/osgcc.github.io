require 'tilt'

markdown = ARGV[0]

basename = File.basename(markdown, File.extname(markdown))
dirname = File.dirname(markdown)

layout = Tilt.new('layout/base.haml')

output = layout.render do
  Tilt.new('layout/content.haml').render do
    renderer = Tilt.new(markdown)
    renderer.render self
  end
end

output.gsub! /<p>(<img.*?)alt\=\"header\"(.*?)>/, "<p class=\"header_image\">\\1class=\"header\">"

File.open("#{basename}.html", "w+b") do |f|
  f.write output
end

