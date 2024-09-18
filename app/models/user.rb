# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validate :image_content_type

  def image_content_type
    return unless image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])

    errors.add(I18n.t('activestorage.image'), '：ファイル形式が、JPEG, PNG, GIF以外になっています。ファイル形式をご確認ください。')
  end
end
