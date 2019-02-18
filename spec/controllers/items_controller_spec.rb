require 'rails_helper'
describe ItemsController do

  before do
    @user = create(:user)
    @item = create(:item, seller_id: @user.id)
    Payjp.api_key = "sk_test_c62fade9d045b54cd76d7036"
  end

  describe 'GET #show' do
    it "assigns the requested article to @item" do
      get :show, params: { id: @item.id}
      expect(assigns(:item)).to eq @item
    end
  end
  describe 'POST #completed_purchase' do
    it "renders the :completed_purchase template" do
      post :completed_purchase, params: { id: @item.id}
      expect(response).to render_template :completed_purchase
    end
  end
end
