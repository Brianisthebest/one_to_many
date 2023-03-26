require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe 'relationships' do
    it { should belong_to :dungeon }
  end

  describe 'class methods' do
    it '#only_true' do
      Monster.delete_all
      @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
      @monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
      @monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_1.id)
      @monster_3 = Monster.create!(name: "BBEG", boss: true, health: 75, dungeon_id: @dungeon_1.id)

      expect(Monster.only_true).to eq([@monster_2, @monster_3])
    end
  end
end