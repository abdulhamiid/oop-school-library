require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Rental do
  before :each do
    @person = Person.new(2, 'Bob')
    @book = Book.new('The titanic', 'Brian Tracy')
    @rent = Rental.new('28/08/2022', @book, @person)
  end

  context 'create rentals' do
    it 'should populate rentals in person' do
      expect(@rent.person.rentals.length).to eq(1)
    end
  end

  context 'create rentals' do
    it 'should populate rentals in book' do
      expect(@rent.book.rentals.length).to eq(1)
    end
  end

  context 'testing for date' do
    it 'should have date set to user input' do
      expect(@rent.date).to eq('28/08/2022')
    end
  end
end
