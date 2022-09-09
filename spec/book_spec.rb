require_relative '../book'
describe Book do
  before :each do
    @book = Book.new('The blossom', 'Caloz')
  end
  context 'when an object of class book is created' do
    it 'should have correct details' do
      expect(@book.author).to eq 'Caloz'
      expect(@book.title).to eq 'The blossom'
    end
  end
end
