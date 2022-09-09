require_relative '../person'
describe Person do
  before :each do
    @person = Person.new(30, 'loman')
  end
  context 'when an object of class person is created' do
    it 'should have correct details' do
      expect(@person.age).to eq 30
      expect(@person.name).to eq 'loman'
      expect(@person.can_use_service?).to be true
      expect(@person.is_of_age?).to be true
    end
  end
end
