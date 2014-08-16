require 'spec_helper'

describe Comic do

  describe 'initialize' do
    it 'initializes comic book with name' do
      avengers = Comic.new({'name' => 'Avengers'})
      expect(avengers).to be_a Comic
      expect(avengers.name).to eq 'Avengers'
    end
  end

  describe 'all' do
    it 'lists all saved instances of comic' do
      avengers = Comic.new({'name' => 'Avengers'})
      avengers.save
      expect(Comic.all[0].id.to_i).to eq avengers.id
    end
  end

end
