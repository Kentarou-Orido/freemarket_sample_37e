require 'rails_helper'
describe Users::OmniauthCallbacksController do

  describe 'snsをつかったログイン' do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      include OmniAuthTestHelper
      Rails.application.env_config['omniauth.auth'] = sns_mock(name ="hoge", email = "hoge@hoge.com")
    end

    it 'should succeed' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :facebook
      expect(page.status_code).to eq 200
    end
  end
end
