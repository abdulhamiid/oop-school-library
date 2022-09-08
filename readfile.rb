require 'json'
require './book'
require './student'
require './teacher'
require './rental'

class Loaddata
  def self.load_books
    # read from file
    books = []
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    records = JSON.parse(File.read('./data/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end

  def self.load_persons
    # read from file
    people = []
    File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
    records = JSON.parse(File.read('./data/persons.json'))
    records.each do |record|
      person = if record['type'] == 'Student'
                 Student.new(
                   nil,
                   record['age'],
                   record['name'],
                   parent_permission: record['parent_permission']
                 )
               else
                 Teacher.new('', record['age'], record['name'])
               end
      person.id = record['id']
      people << person
    end
    people
  end

  def self.load_rentals(books, persons)
    # read rental file
    rentals = []
    File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
    data = JSON.parse(File.read('./data/rentals.json'))
    data.each do |rental|
      date = rental['date']
      book = books.select { |b| b.title == rental['book'] }[0]
      person = persons.select { |ps| ps.name == rental['person'] }[0]

      # create rental
      rent = Rental.new(date, book, person)
      rentals << rent
    end
    rentals
  end
end
