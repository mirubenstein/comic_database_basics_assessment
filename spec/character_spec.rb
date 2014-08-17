require 'spec_helper'

describe Character do

  describe 'initialize' do
    it 'initializes character with name' do
      hulk = Character.new({'name' => 'Hulk'})
      expect(hulk).to be_a Character
      expect(hulk.name).to eq 'Hulk'
    end
  end

  describe 'all' do
    it 'lists all saved instances of Character' do
      hulk = Character.new({'name' => 'Hulk'})
      hulk.save
      expect(Character.all[0].id.to_i).to eq hulk.id
    end
  end

  describe 'update' do
    it 'updates character name with new name' do
      hulk = Character.new({'name' => 'Hulk'})
      hulk.save
      hulk.update({'name' => 'Cyclops'})
      expect(hulk.name).to eq 'Cyclops'
    end
  end

  describe 'delete' do
    it 'deletes character' do
      hulk = Character.new({'name' => 'Hulk'})
      hulk.save
      hulk.delete
      expect(Character.all).to eq []
    end
  end

end
