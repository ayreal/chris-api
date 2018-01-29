class List < ApplicationRecord
  has_many :list_items
  has_many :items, through: :list_items
  belongs_to :user

  def with_items
    # render serialized JSON for lists to include items
      {name: self.name, id: self.id, completed: self.completed, items: self.items}
  end

  def self.new_from_template(listIds, list)
    # takes user's selection of lists and combines into a new list
    itemAry = listIds.map do |id|
      l = List.find_by(id: id)
      l.items
    end
    itemAry = itemAry.flatten!.uniq
    itemAry.each { |i| list.items << i}
  end

end
