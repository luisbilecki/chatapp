class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Associations
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Shows the nickname stripping the email
  def nick_name
    email.split('@')[0]
  end
end
