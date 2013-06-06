task :default => [:generate]

# Generate all

task :generate => [:generate_thumbs, :generate_html]

# Thumb generation

IMAGES = FileList['images/*/*.png']
THUMBS = IMAGES.pathmap("%{^images,thumbs}d/%n%x")

THUMBS.zip(IMAGES).each do |dest, src|
  file dest => src do
    ruby "thumb.rb #{src} #{dest}"
  end
end

task :generate_thumbs => THUMBS

# HTML compilation

COMPETITIONS = FileList['competitions/*.yml']
HTML = COMPETITIONS.ext('html')

rule '.html' => '.yml' do |t|
  ruby "generate.rb #{t.source}"
end

file "competitions.html" => COMPETITIONS do
  ruby "generate_main.rb"
end

task :generate_html => HTML.concat(["competitions.html"])

# Rackup

task :deploy do
  system %{rackup}
end

# Clean

task :clean do
  rm_f HTML
end

task :clobber => :clean do
  rm_f THUMBS
end
