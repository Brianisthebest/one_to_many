class Monster < ApplicationRecord
  belongs_to :dungeon

  def self.only_true
    Monster.select(:name, :boss, :health, :id).where("boss=true")
  end
end