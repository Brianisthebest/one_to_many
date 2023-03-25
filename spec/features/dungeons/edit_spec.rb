require 'rails_helper'

before(:each) do
  Dungeon.delete_all
  @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
  @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
end

RSpec.describe '/new' do
  describe '#edit_form' do
    it 'will display a form to update the dungeon information and redirect to the dungeon show page' do
      visit "/dungeons/#{@dungeon_1.id}/edit"
      save_and_open_page
      expect(page).to have_field("Name")
      expect(page).to have_content("Final level")
      expect(page).to have_unchecked_field("True")
      expect(page).to have_unchecked_field("False")
      expect(page).to have_field("Difficulty")
    
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    end
  end
end