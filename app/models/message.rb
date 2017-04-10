class Message < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :comment, presence: true, unless: :image_present?

  mount_uploader :image, MessageImageUploader

  private
    def image_present?
      self.image.present?
    end
end
