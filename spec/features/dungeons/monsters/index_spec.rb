RSpec.describe '/dungeons/:id/monsters' do
  describe 'as a visitor, when I visit the dungeon monsters index page' do
    it 'will show me each monster and attributes associated with that dungeon' do

      visit "/dungeons/#{dungeon_1.id}/monsters"
    end
  end
end
# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)