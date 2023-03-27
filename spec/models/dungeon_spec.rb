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
      @demi_human = @dungeon_2.monsters.create!(name: "Demi Human", boss: false, health: 25, created_at: 3.day.ago)
      @malenia = @dungeon_2.monsters.create!(name: "Malenia", boss: true, health: 200, created_at: 1.days.ago)
      @bones = @dungeon_2.monsters.create!(name: "Bones", boss: false, health: 5, created_at: 2.days.ago)
    end
      

    describe "class methods" do
      it "#sorted_by_most_recent" do
        expect(Dungeon.sort_by_most_recent).to eq([@dungeon_3, @dungeon_1, @dungeon_2])
      end
    end
    –
      it "#monster_counts" do
        expect(@dungeon_1.monster_count).to eq(1)
        expect(@dungeon_2.monster_count).to eq(3)
      end
      # User Story 16
      describe '#sort_alphabetically' do
        it 'will sort alphabetically' do
          expect(@dungeon_2.sort_alphabetically).to eq([@bones ,@demi_human, @malenia])
       end
      end

      describe '#sort_by' do
        it 'can sort by name and created time' do
          expect(@dungeon_2.sort_by({sort: 'abc'})).to eq([@bones ,@demi_human, @malenia])
          expect(@dungeon_2.sort_by({sort: 'created_at'})).to eq([@malenia, @bones, @demi_human])
        end
      end
    end