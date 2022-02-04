# Define Corrector class
class Corrector
  def initialize(name)
    @name = name
  end

  def correct_name
    @name.capitalize[0, 9]
  end
end
