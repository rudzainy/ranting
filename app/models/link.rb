class Link < ApplicationRecord
  # TODO: More features for links

  enum 

  is_impressionable
  has_one_attached :image
  has_one_attached :qr_code
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :short_links
  acts_as_list
  before_save :sanitize_url

  before_save :generate_qr_code, if: -> { url_changed? }
    
  enum category: {
    free: 0,
    social: 1,
    anonymous_short_link: 2
  }

  # enum category: {
  #   url:    0,
  #   social: 1,
  #   embed:  2,
  #   custom: 3
  # }

  enum css_class: {
    link_card_1x1: 0,
    link_card_1x2: 1,
    link_card_1x3: 2,
    link_card_2x1: 3,
    link_card_2x2: 4,
    link_card_2x3: 5
  }

  def empty?
    self.title == "" && self.url == "https://"
  end

  private

  def sanitize_url
    self.url = "https://#{self.url}" unless self.url=~/^https?:\/\//
  end

  def generate_qr_code
    qrcode = ::RQRCode::QRCode.new(url)

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

    qr_code.attach(
      io: StringIO.new(qr_png.to_s),
      filename: "link-#{id}-qrcode.png",
      content_type: "image/png"
    )
  end
end
