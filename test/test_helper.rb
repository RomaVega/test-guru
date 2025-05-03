ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all
    self.use_instantiated_fixtures  = false # Отключаем fixtures, чтобы они не мешали
    self.use_transactional_tests = true
    include FactoryBot::Syntax::Methods # Enable FactoryBot methods: create, build, attributes_for, etc.

    # Add more helper methods to be used by all tests here...

    FactoryBot.factories.clear # Очищаем фабрики перед загрузкой
    FactoryBot.find_definitions # Явно загружаем определения фабрик
    puts "Registered factories: #{FactoryBot.factories.map(&:name).inspect}"  end
end
