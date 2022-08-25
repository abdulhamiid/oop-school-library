require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: false)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
