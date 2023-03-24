require 'rails_helper'

RSpec.describe '/dungeons/:id' do
  # User Story 2
  describe 'as a visitor, when I visit the dungeons show page' do
    before(:each) do
      @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
      @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
      
    end

    it 'will show all the dungeon attributes' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_content(@dungeon_1.name)
      expect(page).to have_content("ID: #{@dungeon_1.id}")
      expect(page).to have_content("Final Level: #{@dungeon_1.final_level}.")
      expect(page).to have_content("Difficulty: #{@dungeon_1.difficulty}.")

      visit "/dungeons/#{@dungeon_2.id}"

      expect(page).to have_content(@dungeon_2.name)
      expect(page).to have_content("ID: #{@dungeon_2.id}")
      expect(page).to have_content("Final Level: #{@dungeon_2.final_level}.")
      expect(page).to have_content("Difficulty: #{@dungeon_2.difficulty}.")
    end

    # User Story 7, Parent Child Count
    it 'well show the count for monsters in dungeon' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_content("Monster Count: #{@dungeon_1.monster_count}.")

      visit "/dungeons/#{@dungeon_2.id}"

      expect(page).to have_content("Monster Count: #{@dungeon_2.monster_count}.")
    end
  end
end