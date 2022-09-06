require 'json'

class Database
  def self.writeBooks(books)
    # write to file
    booksRecord = []
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    books.each { |book| booksRecord << {title: book.title, author: book.author} }
    data = JSON.generate(booksRecord)
    File.write("data/books.json", data)
  end

  def self.writePersons(persons)
    # write to file
    personsRecord = []
    File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
    persons.each do |person|
      personsRecord << {
        type: person.class,
        age: person.age,
        name: person.name,
        id: person.id,
        parent_permission: person.can_use_service?
      }
    end
    data = JSON.generate(personsRecord)
    File.write("data/persons.json", data)
  end
end