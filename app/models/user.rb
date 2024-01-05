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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.email.split('@').first
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  private

  def create_default_links
    if links.count == 0
      # Create default group
      group = Group.create(name: "My Links")
      # Creates 5 free links
      group.links.create(user: self, title: '', url: '', category: 'free') while links.count < 5
    end

    if links.where(category: "social").count == 0
      Link.create(
        category: 'social',
        icon: 'twitter',
        icon_style: 'brands',
        position: '6',
        title: 'Twitter',
        url: '',
        user: self,
      )
      Link.create(
        category: 'social',
        icon: 'youtube',
        icon_style: 'brands',
        position: '7',
        title: 'Youtube',
        url: '',
        user: self,
      )
      Link.create(
        category: 'social',
        icon: 'facebook',
        icon_style: 'brands',
        position: '8',
        title: 'Facebook',
        url: '',
        user: self,
      )
      Link.create(
        category: 'social',
        icon: 'whatsapp',
        icon_style: 'brands',
        position: '9',
        title: 'WhatsApp',
        url: '',
        user: self,
      )
      Link.create(
        category: 'social',
        icon: 'linkedin',
        icon_style: 'brands',
        position: '10',
        title: 'LinkedIn',
        url: '',
        user: self,
      )
    end
  end
end
