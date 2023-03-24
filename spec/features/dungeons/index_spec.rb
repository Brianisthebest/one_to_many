require 'rails_helper'

RSpec.describe "/dungeons", type: :feature do
  before(:each) do
    Dungeon.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5, created_at: 1.day.ago)
    @dungeon_2 = Dungeon.create(name: "Gross Sewers?", final_level: false,  difficulty: 2, created_at: 2.days.ago)
  end
  # User Story 1
  describe "as a vistor, I visit dungeons index page" do
    it 'will display the name of each dungeon' do
      visit "/dungeons"

      expect(page).to have_content("Dungeons Index")
      expect(page).to have_content(@dungeon_1.name)
      expect(page).to have_content("Created at: #{@dungeon_1.created_at}")
      expect(page).to have_content(@dungeon_2.name)
      expect(page).to have_content("Created at: #{@dungeon_2.created_at}")
      expect(page).to_not have_content(@dungeon_1.final_level)
    end
    # User Story 6
    it 'sorts the dungeons by most recently created' do
      visit "/dungeons"

      expect(@dungeon_1.name).to appear_before(@dungeon_2.name)
    end

    it 'will display a link to dungeon and monster index' do
      visit "/dungeons"
      # require 'pry'; binding.pry

      expect(page).to have_link("Dungeons")
      expect(page).to have_link("Monsters")
    end
  end
end