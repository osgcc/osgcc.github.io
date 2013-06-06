use Rack::Static,
  :urls => ["/images", "/thumbs", "/js", "/css", "/competitions", "/", "/games"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    ""
  ]
}
