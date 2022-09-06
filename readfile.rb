require 'json'
require './book'
require './student'
require './teacher'

class Loaddata
  def self.load_books(books)
    # read from file
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    records = JSON.parse(File.read('./data/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
  end

  def self.load_persons(persons)
    # read from file
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
  end
end