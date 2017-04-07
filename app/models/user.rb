class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :group_users
  has_many :group_users, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :order_by_name, -> { order(name: :asc) }

end
