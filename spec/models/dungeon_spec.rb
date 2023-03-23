require 'rails_helper'

describe Dungeon, type: :model do
  before(:each) do
      @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
      @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
      @monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: dungeon_1.id)
      @monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: dungeon_2.id)
      @monster_3 = Monster.create!(name: "Skeleton", boss: false, health: 25, dungeon_id: dungeon_2.id)
    end
      
    describe "relationships" do
      it { should have_many :monsters }
    end
  end