class Link < ApplicationRecord
  belongs_to :user
  acts_as_list
  before_save :sanitize_url

  private

  def sanitize_url
    self.url = "https://#{self.url}" unless self.url=~/^https?:\/\//
  end
end
