require 'rails_helper'
describe User do

  describe '#create' do

    context 'ユーザーが新規登録できる場合' do
      it 'ニックネームと名字と名前と名字（カナ）と名前（カナ）と誕生日と電話番号とemailとパスワードがあれば保存できる' do
        expect(build(:user)).to be_valid
      end
    end

    context 'ユーザーが新規登録できない場合' do
      it 'ニックネームがない' do
        users = build(:user, nickname: nil)
        users.valid?
        expect(users.errors[:nickname]).to include('を入力してください')
      end
      it '名字がない' do
        users = build(:user, family_name: nil)
        users.valid?
        expect(users.errors[:family_name]).to include('を入力してください')
      end
      it '名前がない' do
        users = build(:user, first_name: nil)
        users.valid?
        expect(users.errors[:first_name]).to include('を入力してください')
      end
      it '名字(カナ)がない' do
        users = build(:user, family_name_kana: nil)
        users.valid?
        expect(users.errors[:family_name_kana]).to include('を入力してください')
      end
      it '名前(カナ)がない' do
        users = build(:user, first_name_kana: nil)
        users.valid?
        expect(users.errors[:first_name_kana]).to include('を入力してください')
      end
      it '誕生日がない' do
        users = build(:user, birthday: nil)
        users.valid?
        expect(users.errors[:birthday]).to include('を入力してください')
      end
      it '電話番号がない' do
        users = build(:user, telephone: nil)
        users.valid?
        expect(users.errors[:telephone]).to include('を入力してください')
      end
      it '電話番号がすでに存在する' do
        user = create(:user)
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します')
      end
      it 'パスワードが５文字以下' do
        users = build(:user, password: "12345", password_confirmation: "12345")
        users.valid?
        expect(users.errors[:password]).to include('は6文字以上で入力してください')
      end
    end
  end
end
