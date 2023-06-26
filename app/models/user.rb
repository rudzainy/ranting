class User < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  friendly_id :username, use: %i[slugged]

  validates :full_name, length: { maximum: 64 }
  validates :description, length: { maximum: 128 }
  validates_format_of :username, :with => /\A[a-z0-9]+\z/i
  
  validate :valid_username

  def valid_username
    errors.add(:username, ' is already taken.') if User.exists?(username:)

    restricted_username_list = %(admin root dashboard analytics design settings preferences)

    errors.add(:username, ' is restricted.') if restricted_username_list.include?(username)
  end

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

end
