class ShortLink < ApplicationRecord
  is_impressionable
  has_one_attached :qr_code
  belongs_to :link

  before_create :generate_qr_code

  private

  def generate_qr_code
    url = "#{ENV["APP_URL"]}/short_link_redirects/#{url_token}"
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
      filename: "short-link-#{id}-qrcode.png",
      content_type: "image/png"
    )
  end
end
