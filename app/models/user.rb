class User < ApplicationRecord
  has_many :lists
  has_secure_password validations: false
  validates :name, presence: true
  validates :name, uniqueness: true

  def lists_with_items
    self.lists.map do |list|
      {name: list.name, id: list.id, completed: list.completed, items: list.items}
    end
  end
end
