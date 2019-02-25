class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  private
    def check_captcha
      unless verify_recaptcha secret_key: "6LcqppIUAAAAAPk8H5lvq90DIxnU5xXJoq6lyfUy"
        self.resource = resource_class.new sign_up_params
        resource.validate
        set_minimum_password_length
        respond_with resource
      end
    end

    def after_sign_up_path_for(resource)
      new_user_address_path(@user)
    end

    def get_user_id
      @user = User.find(params[:id])
    end
end
