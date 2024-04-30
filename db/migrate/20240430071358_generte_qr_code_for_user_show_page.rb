class GenerteQrCodeForUserShowPage < ActiveRecord::Migration[7.0]
  def change
    User.all.send!(generate_qr_code)
  end
end
