require 'json'

class Database
  def self.write_books(books)
    # write to file
    books_record = []
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    books.each { |book| books_record << { title: book.title, author: book.author } }
    data = JSON.generate(books_record)
    File.write('data/books.json', data)
  end

  def self.write_persons(persons)
    # write to file
    persons_record = []
    File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
    persons.each do |person|
      persons_record << {
        type: person.class,
        age: person.age,
        name: person.name,
        id: person.id,
        parent_permission: person.can_use_service?
      }
    end
    data = JSON.generate(persons_record)
    File.write('data/persons.json', data)
  end

  def self.write_rentals(rentals)
    # write rental
    rental_records = []
    File.write('data/rentals.json', []) unless File.exist?('data/rentals.json')
    rentals.each do |rental|
      rental_records << {
        person: rental.person.name,
        id: rental.person.id,
        age: rental.person.age,
        book: rental.book.title,
        date: rental.date,
        author: rental.book.author
      }
    end
    data_json = JSON.generate(rental_records)
    File.write('data/rentals.json', data_json)
  end
end
