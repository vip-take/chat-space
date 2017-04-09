require 'rails_helper'

describe MessagesController do
  login_user
  let!(:group) { create(:group, user_ids: [user.id]) }

  describe 'GET #index' do
    it 'groupのインスタンスが作成され、@groupにアサインされること' do
      get :index, id: group
      expect(assigns(:group)).to eq group
    end

    it 'indexのテンプレートが選択されること' do
      get :index, id: group
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let!(:message_params) { { comment: 'hogehoge' } }

    it 'POSTされたコメントデータが@messageにアサインされること' do
      expect{
        post :create, id: group, message: message_params
      }.to change(Message, :count).by(1)
    end
    it 'indexのビューが表示されること' do
      post :create, id: group, message: message_params
      expect(response).to redirect_to messages_path(group)
    end
  end
end
