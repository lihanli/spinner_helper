require 'rake/testtask'

SCRIPT_FILE = "dist/spinner_helper.js"

def build_dist
  `cat src/js/*.js > #{SCRIPT_FILE}`
  `coffee -p -c src >> #{SCRIPT_FILE}`
  puts 'dist built'
  build_assets_js
end

def build_assets_js
  script_file = 'assets/js/script.js'

  `cat bower_components/jquery/jquery.js > #{script_file}`
  `cat bower_components/spin.js/dist/spin.js >> #{script_file}`
  `cat dist/spinner_helper.js >> #{script_file}`
  `coffee -p -c assets/src/js >> #{script_file}`
  `uglifyjs -o #{script_file} #{script_file}`

  puts 'assets js built'
end

def build_assets_css
  `sass -r sass-css-importer assets/src/css/style.scss assets/css/style.css -t compressed`
  puts 'assets css built'
end

task :build do
  build_dist
  build_assets_css
end

Rake::TestTask.new('do_tests') do |t|
  t.libs << "test"
  t.test_files = FileList['test/tests/**/*.rb']
end

task test: [:build, :do_tests] do
end

task watch: [:build] do
  require 'listen'

  Listen.to('src') do |modified, added, removed|
    build_dist
  end

  %w(css js).each do |type|
    Listen.to("assets/src/#{type}") do |modified, added, removed|
      send("build_assets_#{type}")
    end
  end

  sleep 10 while true
end
