require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  let(:chat_room) { FactoryBot.create :chat_room }
  let(:chat_room_params) { attributes_for(:chat_room) }

  describe 'as a Unauthorized User' do
    it 'GET #index' do
      get :index

      expect(response).not_to be_success
    end

    it 'GET #show' do
      get :show, params: { id: chat_room.id }

      expect(response).not_to be_success
    end

    it 'GET #new' do
      get :new

      expect(response).not_to be_success
    end

    it 'POST #create' do
      expect{
        post :create, params: { chat_room: chat_room_params }
      }.not_to change(ChatRoom, :count)
    end

    it 'DELETE #destroy' do
      delete :destroy, params: { id: chat_room.id }

      expect(response).not_to be_success
    end
  end

  describe 'as a Authorized User' do
    before do
      user = create(:user)
      sign_in user
    end

    describe 'GET #index' do
      before { get :index }

      it 'response should be success' do
        expect(response).to be_success
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      context 'with valid id' do
        before {
          chat_room = FactoryBot.create :chat_room
          get :show, params: {id: chat_room.id}
        }

        it 'response should be success' do
          expect(response).to be_success
        end

        it 'renders the show template' do
          expect(response).to render_template(:show)
        end
      end

      context 'with invalid id' do
        before {
          get :show, params: {id: 0}
        }

        it 'response should not be success' do
          expect(response).not_to be_success
        end

        it 'redirects to chat_room_path' do
          expect(response).to redirect_to chat_rooms_path
        end
      end
    end

    describe 'GET #new' do
      before { get :new }

      it 'response should be success' do
        expect(response).to be_success
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
          it 'creates a new chat room' do
            expect{
              post :create, params: { chat_room: chat_room_params }
            }.to change(ChatRoom, :count).by(1)
          end

          it  'shows flash success' do
            post :create, params: { chat_room: chat_room_params }

            expect(flash[:success]).to match(/added/)
          end
      end

      context 'with invalid attributes' do
        before { chat_room.title = nil }

        it 'does not save the code in DB' do
          expect{
            post :create, params: { chat_room: chat_room.attributes }
          }.not_to change(ChatRoom, :count)
        end

        it 're-render the new template' do
          post :create, params: { chat_room: chat_room.attributes }

          expect(response).to render_template(:new)
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'with valid id' do
        before :each do
          @chat_room = FactoryBot.create :chat_room
        end

        it 'deletes the chat room' do
          expect{
            delete :destroy, params: { id: @chat_room.id }
            }.to change(ChatRoom, :count).by(-1)
        end

        it 'redirects to chat_rooms_path' do
          delete :destroy, params: { id: @chat_room.id }

          expect(response).to redirect_to chat_rooms_path
        end

        it 'shows the flash notice' do
          delete :destroy, params: { id: @chat_room.id }

          expect(flash[:notice]).to match(/deleted/)
        end
      end

      context 'with different user' do
        before :each do
          new_user = create(:user)
          chat_room = create(:chat_room, user: new_user)
        end

        it 'redirects to chat_rooms_path' do
          delete :destroy, params: { id: chat_room.id }
          expect(response).to redirect_to chat_rooms_path
        end

        it 'not delete the chat room' do
          expect{
            delete :destroy, params: { id: chat_room.id }
            }.not_to change(ChatRoom, :count)
        end
      end
    end
  end
end
