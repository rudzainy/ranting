class Group < ApplicationRecord
  # TODO: Groups should be sharable sharable
  belongs_to :created_by, class_name: "User", foreign_key: "user_id"
  has_many :links
end
