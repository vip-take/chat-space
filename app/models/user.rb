class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :group_users
  has_many :group_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :order_by_name_without, ->(id) { order(name: :asc).where.not(id: id) }
  scope :with_name, ->(text) { where('name LIKE ?', "#{text}%" ) }

end
