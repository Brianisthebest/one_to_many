class Dungeon < ApplicationRecord
  has_many :monsters

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def monster_count
    monsters.count
  end

  def sort_alphabetically
    require 'pry'; binding.pry
    monsters.order(:name)
  end
end