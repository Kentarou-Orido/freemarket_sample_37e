class AddressesController < ApplicationController

  def new
    creating_address_instance
    @user = User.find(params[:user_id])
  end

  def create
    creating_address_instance(addresse_params)
    if @address.save
      redirect_to root_path, notice: "新規登録が完了しました！ようこそ！"
    else
      render :new, notice: "新規登録に失敗しました。もう一度、入力をお願い致します"
    end
  end

  private

  def creating_address_instance
    @address = Address.new
  end

  def addresse_params
    params.require(:address).permit(:postcode, :prefectures, :municipality, :street_number, :building_name, :room_number, :remarks).merge(user_id: params[:user_id])
  end
end
