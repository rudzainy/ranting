class MailingListEmail < ApplicationRecord
  validates :email_address, uniqueness: true
end
