Warbler::Config.new do |config|
    config.jar_name = "lilruby"
    config.dirs     = %w(views public)
    config.includes = FileList["config.ru","app.rb","config.yml"]
    config.webxml.rack.env = ENV['RACK_ENV'] || 'production'
end
