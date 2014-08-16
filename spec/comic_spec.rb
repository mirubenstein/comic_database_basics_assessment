require 'spec_helper'

describe Comic do

  describe 'initialize' do
    it 'initializes comic book with name' do
      avengers = Comic.new({name: 'Avengers'})
      expect(avengers).to be_a Comic
      expect(avengers.name).to eq 'Avengers'
    end
  end

end
