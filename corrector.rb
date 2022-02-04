require_relative 'person'

# Define Corrector class
class Corrector < Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    super
  end

  def correct_name
    @name.capitalize[0, 9]
  end
end

test2 = Corrector.new(30, 'luis fernando jimenez')
test2.correct_name
