class Message < ApplicationRecord
  # Callbacks
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  # Associations
  belongs_to :user
  belongs_to :chat_room

  # Validations
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  # Convert created at to time
  def get_time
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
