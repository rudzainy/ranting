class User < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :links, dependent: :destroy
  
  friendly_id :username, use: %i[slugged]

  after_create :create_default_links
  after_update :create_default_links

  validates :full_name, length: { maximum: 64 }
  validates :description, length: { maximum: 128 }
  validates_format_of :username, :with => /\A[a-z0-9]+\z/i
  validate :valid_username

  def valid_username
    if self.should_generate_new_friendly_id?
      errors.add(:username, ' is already taken.') if User.exists?(username:)
    end
    
    restricted_username_list = %(admin root dashboard analytics design settings preferences)

    errors.add(:username, ' is restricted.') if restricted_username_list.include?(username)
  end

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  private

  def create_default_links
    Link.create(user: self, title: '', url: '') while links.count < 5
  end

end
