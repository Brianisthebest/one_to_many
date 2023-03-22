require 'rails_helper'

describe Dungeon, type: :model do
  describe "relationships" do
    it { should have_many :monsters }
  end
end