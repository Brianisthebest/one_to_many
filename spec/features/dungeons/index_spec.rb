require 'rails_helper'

RSpec.describe "/dungeons", type: :feature do
  # User Story 1
  describe "as a vistor, I visit dungeons index page" do
    it 'will display the name of each dungeon' do
      dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
      dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
      
      visit "/dungeons"
      
      expect(page).to have_content(dungeon_1.name)
      expect(page).to have_content(dungeon_2.name)
      expect(page).to_not have_content(dungeon_1.final_level)
    end
  end
end