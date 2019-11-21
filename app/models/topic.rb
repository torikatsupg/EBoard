class Topic < ApplicationRecord
  def self.search(search)
    if search
      Topic.where(['title LIKE ?', "%#{search}%"])
    else
      Topic.all
    end
  end
end
