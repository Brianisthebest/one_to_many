require 'rails_helper'

RSpec.describe '/dungeons/show' do
  describe 'as a visitor, when I visit the dungeons show page' do
    it 'will show all the dungeon attributes' do
      dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)

      visit "/dungeons/#{dungeon_1.id}"

      expect(page).to have_content(dungeon_1.name)
      expect(page).to have_content("Final Level: #{dungeon_1.final_level}.")
      expect(page).to have_content("Difficulty: #{dungeon_1.difficulty}.")
    end
  end
end