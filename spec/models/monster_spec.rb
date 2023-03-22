require 'rails_helper'

describe Monster, type: :model do
  describe 'relationships' do
    it { should belong_to :dungeon }
  end
end