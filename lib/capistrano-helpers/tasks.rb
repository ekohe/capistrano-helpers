base = File.expand_path('..', __FILE__)
Dir.glob("#{base}/**/*.rb").each { |f| require f }
