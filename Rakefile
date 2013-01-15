SCRIPT_FILE = "lib/spinner_helper.js"

task :build do
  `cat src/js/*.js > #{SCRIPT_FILE}`
  `coffee -p -c src >> #{SCRIPT_FILE}`
  puts 'compile done'
end

task :test do
  require 'selenium-webdriver'
  require 'minitest/autorun'
  require 'turn'
  require 'pry'

  class SpinnerHelperTest < MiniTest::Unit::TestCase
    def setup
      @driver = Selenium::WebDriver.for :firefox
      @driver.manage.timeouts.implicit_wait = 0
      @wait = Selenium::WebDriver::Wait.new(timeout: 45)
      @driver.get "file://#{Dir.pwd}/test/test.html"
    end

    def wait_for_element(type, name)
      element = -> { fe(type, name) }
      wait_until { element.().displayed? }
      element.()
    end

    def wait_until(&block)
      @wait.until &block
    end

    def fe(type, name)
      @driver.find_element type, name
    end

    def get_js(code)
      @driver.execute_script "return #{code}"
    end

    def test_spinner_helper
      button = fe(:id, 'button')
      output = fe(:id, 'output')

      button.click
      assert_equal "66px", get_js("$('#button').css('width')")
      assert_equal "40px", get_js("$('#button').css('line-height')")

      wait_until { button.attribute('style') == '' }
      assert_equal '0', output.text

      button.click
      wait_until { output.text == "1" }

      @driver.quit
    end
  end
end

task watch: [:build] do
  require 'listen'

  Listen.to('src') do |modified, added, removed|
    Rake::Task["build"].execute
  end

end