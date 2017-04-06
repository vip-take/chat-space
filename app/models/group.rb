class Group < ApplicationRecord
  validates :name, presence: true, null: false,  uniqueness: true
end
