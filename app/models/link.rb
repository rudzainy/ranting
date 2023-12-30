class Link < ApplicationRecord
  is_impressionable
  belongs_to :user
  belongs_to :group
  acts_as_list
  before_save :sanitize_url

  enum category: {
    free: 0,
    social: 1
  }

  def empty?
    self.title == "" && self.url == "https://"
  end

  private

  def sanitize_url
    self.url = "https://#{self.url}" unless self.url=~/^https?:\/\//
  end
end
