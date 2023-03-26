class Dungeon < ApplicationRecord
  has_many :monsters

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def monster_count
    monsters.count
  end

  def sort_alphabetically
    monsters.order(:name)
  end

  def sort_by(params)
    if params[:sort] == 'abc'
      monsters.order(:name)
    else
      monsters.order(:created_at)
    end
  end
end