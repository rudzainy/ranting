class ShortLink < ApplicationRecord
  is_impressionable
  belongs_to :link
end
