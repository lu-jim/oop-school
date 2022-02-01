require_relative 'person'

# Define Teacher class
class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
