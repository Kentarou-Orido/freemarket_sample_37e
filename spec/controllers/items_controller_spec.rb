require 'rails_helper'
describe ItemsController do

  before do
    @user = create(:user)
    @brand = create(:brand)
    @item = create(:item, seller_id: @user.id, brand_id: @brand.id)
  end

  describe "#index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
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
