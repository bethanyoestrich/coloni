class Colony < ApplicationRecord
  has_many :cats, dependent: :destroy
end
