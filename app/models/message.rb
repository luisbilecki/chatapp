class Message < ApplicationRecord
  # Enum
  # Text is used when bob sends a message to alice
  # Info is used to notice when users enter and leave the room
  enum mtype: { text: 0, info: 1 }

  # Callbacks
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  # Associations
  belongs_to :user
  belongs_to :chat_room

  # Validations
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  validates :mtype, presence: true

  # Convert created at to time
  def get_time
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
