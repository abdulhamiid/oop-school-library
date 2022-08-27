class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.add_rentals << self
    @person = person
    person.add_rentals << self
  end
end