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

end
