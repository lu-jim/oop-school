# Define Corrector class
class Corrector
  def initialize(name)
    @name = name
  end

  def correct_name
    @name.capitalize[0, 10]
  end
end
