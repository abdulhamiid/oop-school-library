require_relative 'nameable'

class Person < Nameable
  attr_accessor :rentals, :age, :name, :id

  def initialize(age, name = 'Unknown', parent_permission: false)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(date, book, person)
    @rentals << Rental.new(date, book, self)
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
