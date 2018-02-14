class Message < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :chat_room

  # Convert created at to time
  def get_time
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
