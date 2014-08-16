require 'spec_helper'

describe Character do

  describe 'initialize' do
    it 'initializes character with name' do
      hulk = Character.new({'name' => 'Hulk'})
      expect(hulk).to be_a Character
      expect(hulk.name).to eq 'Hulk'
    end
  end

end
