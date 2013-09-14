require 'rake/testtask'

SCRIPT_FILE = "dist/spinner_helper.js"

task :build do
  `coffee -p -c src > #{SCRIPT_FILE}`
  puts 'compile done'
end

Rake::TestTask.new('test') do |t|
  Rake::Task["build"].execute

  t.libs << "test"
  t.test_files = FileList['test/tests/**/*.rb']
end

task watch: [:build] do
  require 'listen'

  Listen.to('src') do |modified, added, removed|
    Rake::Task["build"].execute
  end

  sleep 10 while true
end
