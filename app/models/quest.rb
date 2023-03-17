class Quest < ApplicationRecord
end

class Quest < ApplicationRecord
    has_many :scenes
  
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
  end
  