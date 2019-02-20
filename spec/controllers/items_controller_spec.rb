require 'rails_helper'
describe ItemsController do

  before do
    @user = create(:user)
    @item = create(:item, seller_id: @user.id)
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: { id: @item.id }
      expect(response).to render_template :show
    end
    it "assigns the requested article to @item" do
      get :show, params: { id: @item}
      expect(assigns(:item)).to eq @item
    end
  end
  describe 'POST #completed_purchase' do
    it "renders the :completed_purchase template" do
      post :completed_purchase, params: { id: @item.id }
      expect(response).to render_template :completed_purchase
    end
  end
end
