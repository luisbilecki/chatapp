class ChatRoom < ApplicationRecord
  belongs_to :user

  # Associations
  has_many :messages, dependent: :destroy
end
