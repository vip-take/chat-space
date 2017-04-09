require "rails_helper"

describe User do
  describe '#create' do
    let(:user) { build(:user)}
    context 'name, email, password, password_confirmaionの値が正しい場合' do
      it '正常に保存できること' do
        expect(user).to be_valid
      end
    end

    context 'nameが空の場合' do
      it 'エラーとなり、保存できないこと' do
        user = build(:user, name: "")
        expect(user).to_not be_valid
      end
    end

    context 'emailが空の場合' do
      it 'エラーとなり、保存できないこと' do
        user = build(:user, email: "")
        expect(user).to_not be_valid
      end
    end

    context 'emailに@が含まれていない場合' do
      it 'エラーとなり、保存できないこと' do
        user = build(:user, email: "aaaaaa")
        expect(user).to_not be_valid
      end
    end

    context 'passwordが5文字以下の場合' do
      it 'エラーとなり、保存できないこと' do
        user = build(:user, password: "12345", password_confirmation: "12345")
        expect(user).to_not be_valid
      end
    end

    context 'passwordとpassword_confirmationが不一致の場合' do
      it 'エラーとなり、保存できないこと' do
        user = build(:user, password: "12345", password_confirmation: "55555")
        expect(user).to_not be_valid
      end
    end
  end
end
