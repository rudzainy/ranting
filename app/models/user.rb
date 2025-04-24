class User < ApplicationRecord
  is_impressionable
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_one_attached :avatar
  has_one_attached :qr_code
  has_many :links, dependent: :destroy
  has_one :profile
  accepts_nested_attributes_for :profile

  friendly_id :username, use: %i[slugged]

  validates :full_name, length: { maximum: 64 }
  validates :description, length: { maximum: 256 }
  validates_format_of :username, :with => /\A[a-z0-9]+\z/i
  validates :username, uniqueness: true
  validate :valid_username

  scope :anonymous_short_links, -> { where(self.links.where(categories: :anonymous_short_link)) }

  def valid_username
    
    restricted_username_list = %(admin root dashboard analytics design settings preferences membership licences_disclaimer contact usecases faq)

    errors.add(:username, ' is restricted.') if restricted_username_list.include?(username)
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      unless User.where(username: auth.info.email.split('@').first).exists?
        user.username = "#{auth.info.email.split('@').first}"
      end
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
