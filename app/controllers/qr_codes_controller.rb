class QrCodesController < ApplicationController

  def new
    @qr_code = ShortLink.new
  end
end
