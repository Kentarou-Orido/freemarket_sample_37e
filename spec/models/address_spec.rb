require 'rails_helper'
describe Address do

  describe '#create' do

    context 'ユーザーがお届け先を登録できる場合' do
      it '郵便番号と都道府県と市区町村と町名・番地とuser_idがあれば保存できる' do
        user = FactoryGirl.create(:user)
        expect(build(:address)).to be_valid
      end
    end

    context 'ユーザーがお届け先を登録できない場合' do
      it '郵便番号がない' do
        address = build(:address, postcode: nil)
        address.valid?
        expect(address.errors[:postcode]).to include('を入力してください')
      end
      it '都道府県がない' do
        address = build(:address, prefectures: nil)
        address.valid?
        expect(address.errors[:prefectures]).to include('を入力してください')
      end
      it '市区町村がない' do
        address = build(:address, municipality: nil)
        address.valid?
        expect(address.errors[:municipality]).to include('を入力してください')
      end
      it '町名・番地がない' do
        address = build(:address, street_number: nil)
        address.valid?
        expect(address.errors[:street_number]).to include('を入力してください')
      end
      it 'user_idがない' do
        address = build(:address, user_id: nil)
        address.valid?
        expect(address.errors[:user]).to include('を入力してください')
      end
    end
  end
end
