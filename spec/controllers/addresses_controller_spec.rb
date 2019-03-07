require 'rails_helper'
describe AddressesController do

  before do
    @user = create(:user)
    @address = create(:address)
    login_user(@user)
  end

  describe 'GET #new' do

    it "newアクションのビューが描画されるか" do
      get :new, params: { user_id: @address.user_id }
      expect(response).to render_template :new
    end

    it "リクエストが成功するか" do
      get :new, params: { user_id: @address.user_id }
      expect(response.status).to eq 200
    end

    it "@addressがnewされていること" do
      get :new, params: { user_id: @address.user_id }
      expect(assigns :address).to_not be_nil
    end
  end


  describe 'POST #create' do

    context 'パラメーターが妥当な場合' do
      it "リクエストが成功すること" do
        post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address) }
        expect(response.status).to eq 302
      end

      it "ユーザーがお届け先を登録できる" do
        expect do
          post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address) }
        end.to change(Address, :count).by(1)
      end

      it "リダイレクトすること" do
        post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address) }
        expect(response).to redirect_to root_path
      end
    end

    context 'パラメーターが不正な場合' do
      it "リクエストが成功すること" do
        get :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address, :invalid) }
        expect(response.status).to eq 200
      end

      it "ユーザーがお届け先を登録できない" do
        post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address, :invalid) }
        expect(response).to render_template :new
      end

      it "newテンプレートが表示されること" do
        post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address, :invalid) }
        expect(response).to render_template :new
      end

      it "エラーが表示されること" do
        post :create, params: { user_id: @address.user_id, address: FactoryGirl.attributes_for(:address, :invalid) }
        expect(assigns(:address).errors.any?).to be_truthy
      end
    end
  end
end
