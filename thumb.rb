require 'RMagick'
require 'fileutils'

WIDTH = 200
HEIGHT = 150

image = Magick::Image.read(ARGV[0]).first
thumb = image.resize_to_fill(WIDTH, HEIGHT)

dirname = File.dirname(ARGV[1])
FileUtils.mkdir_p dirname

thumb.write ARGV[1]
