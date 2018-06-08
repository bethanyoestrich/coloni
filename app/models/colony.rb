class Colony < ApplicationRecord
  has_many :cats, dependent: :destroy
  belongs_to :user
end
