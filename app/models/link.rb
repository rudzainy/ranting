class Link < ApplicationRecord
  is_impressionable
  belongs_to :user
  acts_as_list
  before_save :sanitize_url

  def empty?
    self.title == "" && self.url == "https://"
  end

  private

  def sanitize_url
    self.url = "https://#{self.url}" unless self.url=~/^https?:\/\//
  end
end
