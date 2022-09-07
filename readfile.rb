require 'json'
require './book'
require './student'
require './teacher'
require './rental'
class Loaddata
  def self.load_books
    # read from file
    books =[]
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    records = JSON.parse(File.read('./data/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end

  def self.load_persons
    # read from file
    persons=[]
    File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
    records = JSON.parse(File.read('./data/persons.json'))
    records.each do |person|
      if person['type'] == 'Student' 
        persons << Student.new(
          '', 
          person['age'],
          person['name'],
          parent_permission: person['parent_permission']
        )
      elsif person['type'] == 'Teacher'
        persons << Teacher.new(
          nil,
          person['age'],
          person['name'],
          parent_permission: person['parent_permission']
        )
      end
    end
    persons
  end

  def self.load_rentals(persons)
  # read rental file
  rentals =[]
  File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
  data =JSON.parse(File.read('./data/rentals.json'))
  data.each do |rent| 
    person = persons.select{ |person| person.id == rent.id }
    rentals << Rental.new(rent['date'], Book.new(rent.title, rent.author), person)
  end
  rentals
  end
end