require 'rails_helper'

RSpec.describe Dungeon, type: :model do
  describe "relationships" do
    it { should have_many :monsters }
  end
    before(:each) do
      Dungeon.delete_all
      @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5, created_at: 2.days.ago)
      @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2, created_at: 3.days.ago)
      @dungeon_3 = Dungeon.create!(name: "Lake of Rot", final_level: false,  difficulty: 6, created_at: 1.day.ago)
      @skeleton = @dungeon_1.monsters.create!(name: "Skeleton", boss: false, health: 10)
      @demi_human = @dungeon_2.monsters.create!(name: "Demi Human", boss: false, health: 25)
      @malenia = @dungeon_2.monsters.create!(name: "Malenia", boss: true, health: 200)
    end
      

    describe "class methods" do
      it "#sorted_by_most_recent" do
        expect(Dungeon.sort_by_most_recent).to eq([@dungeon_3, @dungeon_1, @dungeon_2])
      end
    end
    
    describe "instance methods" do
      it "#monster_counts" do
        expect(@dungeon_1.monster_count).to eq(1)
        expect(@dungeon_2.monster_count).to eq(2)
      end
    end
  end