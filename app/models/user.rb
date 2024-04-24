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

  friendly_id :username, use: %i[slugged]

  after_create :create_default_links, :generate_qr_code
  after_update :create_default_links

  validates :full_name, length: { maximum: 64 }
  validates :description, length: { maximum: 256 }
  validates_format_of :username, :with => /\A[a-z0-9]+\z/i
  validates :username, uniqueness: true
  validate :valid_username


  def valid_username
    
    restricted_username_list = %(admin root dashboard analytics design settings preferences membership licences_disclaimer contact usecases faq)

    errors.add(:username, ' is restricted.') if restricted_username_list.include?(username)
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
    if self.links.count == 0
      # Create default group
      default_group = Group.create(name: "My Links")
      # Creates 5 free links
      default_group.links.create(user: self, title: 'Change this', url: '', category: 'free') while self.links.count < 5
      
      social_group = Group.create(name: "My Social Media")
      social_group.links.create(
        category: 'social',
        icon: 'twitter',
        icon_style: 'brands',
        position: '6',
        title: 'Twitter',
        url: 'twitter.com/your_username',
        user: self,
      )
      social_group.links.create(
        category: 'social',
        icon: 'whatsapp',
        icon_style: 'brands',
        position: '7',
        title: 'Whatsapp',
        url: 'wa.me/60123456789',
        user: self,
      )
      social_group.links.create(
        category: 'social',
        icon: 'facebook',
        icon_style: 'brands',
        position: '8',
        title: 'Facebook',
        url: 'facebook.com/your_username',
        user: self,
      )
      social_group.links.create(
        category: 'social',
        icon: 'instagram',
        icon_style: 'brands',
        position: '9',
        title: 'Instagram',
        url: 'instagram.com/your_username',
        user: self,
      )
      social_group.links.create(
        category: 'social',
        icon: 'linkedin',
        icon_style: 'brands',
        position: '10',
        title: 'LinkedIn',
        url: 'linkedin.com/in/your_username',
        user: self,
      )
    end
  end

  def generate_qr_code
    qrcode = RQRCode::QRCode.new("#{ENV['APP_URL']}/#{self.slug}")

    # NOTE: showing with default options specified explicitly
    qr_png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    self.qr_code.attach(
      io: StringIO.new(qr_png.to_s),
      filename: "user-#{self.id}-qrcode.png",
      content_type: "image/png"
    )
  end
end
