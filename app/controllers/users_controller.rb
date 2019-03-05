class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :obtainment_user_id, only: [:show]
  before_action :verification_address, only: [:show]

  def show

  end

private
  def obtainment_user_id
    @user = User.find(params[:id])
  end

  def verification_address
    finding_address = @user.addresses
    redirect_to new_user_address_path(@user), notice: "#{current_user.nickname}様はお届け先住所が登録されていません。お届け先住所の入力は必須ですので、ご登録ください" unless finding_address.exists?
  end
end
