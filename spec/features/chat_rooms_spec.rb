require 'rails_helper'

RSpec.feature 'ChatRooms', type: :feature, js: true do
  let(:chat_room) { create(:chat_room) }

  it 'sends a message' do
    # Log in
    user = create(:user)
    login_as(user, :scope => :user)

    # Visit the chat_room
    visit chat_room_path(chat_room.id)

    # Get message count
    messages_size = Message.count
    p messages_size

    # Sends a message
    content = 'Test'
    fill_in 'message[body]', with: content
    click_button 'Post'

    # Check if the message was sent
    expect(page).to have_content(content)
    expect(Message.count).to eq(messages_size + 1)
  end
end
