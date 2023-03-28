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
      sort_alphabetically
    elsif params.include?(:length)
      select_with_length(params)
    else
      monsters.order(created_at: :desc)
    end
  end

  def select_with_length(params)
    if params.include?(:length)
      monsters.where("health >= ?", params[:length])
    else
      monsters
    end
  end
end