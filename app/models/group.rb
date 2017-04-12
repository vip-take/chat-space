class Group < ApplicationRecord

  before_validation :group_members_present?

  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true, null: false, uniqueness: true

  private
    def group_members_present?
      self.user_ids.present?
    end

end
