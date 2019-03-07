require 'rails_helper'
describe SellsController do

  describe 'GET #show' do
    it "renders the :show template" do
      get :show
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    it  "renders the :create template" do
      @brand = create(:brand)
      @user = create(:user)
      @item = create(:item, seller: @user, brand: @brand)
      post :create, params: {id: @item_id}
      expect(response).to render_template :create
    end
  end
end
