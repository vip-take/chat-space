class Group < ApplicationRecord

  # TODO:グループメンバーのチェックを入れる
  # before_save :group_members_present?

  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true, null: false,  uniqueness: true

  def group_members_present?
    # self.user_ids.present? && self.user_ids.include?(current_user.id)
  end

end
