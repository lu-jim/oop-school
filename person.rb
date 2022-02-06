require_relative 'corrector'
require 'securerandom'

# Define Person class
class Person
  attr_reader :id, :type
  attr_accessor :name, :age, :rentals

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = SecureRandom.hex(2)
    @age = age
    @name = name
    @parent_permission = true && parent_permission
    @corrector = Corrector.new(@name)
    @type = 'Person'
    @rentals = []
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def can_use_services
    of_age || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age
    @age >= 18
  end
end
