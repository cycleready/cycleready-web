require 'test_helper'
# require 'database_cleaner'


class RouteLookupTest < ActionDispatch::IntegrationTest

  # for setup and tear down each time we run tests
  # self.use_transactional_fixtures = false

  setup do
    # comment in if you want to run tests with selenium
    # Capybara.default_driver = :selenium
  end

  # def setup
  #   @post = posts(:valid_post)
  #   @admin = users(:james)
  #   @regular = users(:steve)
  # end

  test 'normal user experience' do
    visit '/'
    assert page.has_text?('CycleReady')
    click_on 'Routes'
    assert page.has_content?('All Bike Routes')
    click_on 'Neighborhoods'
    assert page.has_content?('Neighborhood')
  end
end
