require './nameable'

class Person < Nameable
  attr_reader :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission: false)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
