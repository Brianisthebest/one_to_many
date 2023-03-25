class Dungeon < ApplicationRecord
  has_many :monsters

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def monster_count
    self.monsters.count
  end
end