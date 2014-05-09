require 'test_helper'

class SpinnerHelperTest < CapybaraTestCase
  def setup
    super
    visit "file://#{Dir.pwd}/test/test.html"
  end

  def assert_spinner_style(val, attr)
    assert_equal(val, get_js("$('.dynamic-spinner').css('#{attr}')"))
  end

  def test
    button = find('#button')
    button.click

    %w(width line-height margin).each do |style|
      assert_spinner_style('100px', style)
    end
    assert_spinner_style('inline-block', 'display')

    assert_equal('color: red; display: none !important;', button[:style])

    wait_until { button[:style] == 'color: red;' }
    assert_text('0', find('#output'))

    assert_has_no_css('.dynamic-spinner')

    # now test if float is saved
    page.execute_script("$('#button').css('float', 'left')")
    button.click
    assert_spinner_style('left', 'float')
  end
end