class QrCodesController < ApplicationController
  impressionist 
  def new
    @qr_code = ShortLink.new
  end
end
