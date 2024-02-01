class Link < ApplicationRecord
  # TODO: More features for links

  enum 

  is_impressionable
  has_one_attached :image
  belongs_to :user
  belongs_to :group
  acts_as_list
  before_save :sanitize_url

  enum category: {
    free:   0,
    social: 1
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
end
