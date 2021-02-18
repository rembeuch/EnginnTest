class Contact < ApplicationRecord
  has_many :tags, dependent: :destroy
end
