class GenerateQrCodeForUser
  attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def call
    qrcode = RQRCode::QRCode.new("#{ENV['APP_URL']}/#{@user.slug}")

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

    @user.qr_code.attach(
      io: StringIO.new(qr_png.to_s),
      filename: "user-#{@user.id}-qrcode.png",
      content_type: "image/png"
    )
  end
end