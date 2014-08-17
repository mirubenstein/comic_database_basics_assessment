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

  describe 'update' do
    it 'updates comic name with new name' do
      avengers = Comic.new({'name' => 'Avengers'})
      avengers.save
      avengers.update({'name' => 'X-Men'})
      expect(avengers.name).to eq 'X-Men'
    end
  end

  describe 'delete' do
    it 'deletes comic' do
      avengers = Comic.new({'name' => 'Avengers'})
      avengers.save
      avengers.delete
      expect(Comic.all).to eq []
    end
  end

  describe 'find' do
    it 'finds and returns comic from id' do
      avengers = Comic.new({'name' => 'Avengers'})
      avengers.save
      expect(Comic.find(avengers.id).name).to eq avengers.name
    end
  end

  describe 'add_character' do
    it 'adds character to comic and lists them' do
      avengers = Comic.new({'name' => 'Avengers'})
      avengers.save
      hulk = Character.new({'name' => 'Hulk'})
      hulk.save
      avengers.add_character(hulk)
      expect(avengers.list_characters[0].name).to eq hulk.name
    end
  end

end
