SCRIPT_FILE = "lib/spinner_helper.js"
CSS_FILE    = "lib/spinner_helper.css"

task :build do
  `cat src/js/*.js | uglifyjs > #{SCRIPT_FILE}`
  `coffee -p -c src | uglifyjs >> #{SCRIPT_FILE}`
  `stylus -c < src/css/spinner_helper.styl > #{CSS_FILE}`
  puts 'compile done'
end

task watch: [:build] do
  require 'rubygems'
  require 'listen'

  Listen.to('src') do |modified, added, removed|
    Rake::Task["build"].execute
  end

end