# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  validate :check_image_content_type

  def check_image_content_type
    return if !image.attached? || (image.attached? && image.content_type.in?(%w[image/jpeg image/png image/gif]))

    errors.add(:image, :not_file_type, name: 'jpeg,png,gif')
  end
end
