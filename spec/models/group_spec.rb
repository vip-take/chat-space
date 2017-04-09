require "rails_helper"

describe Group do
  let!(:user01) { create(:user) }
  let!(:user02) { create(:user) }
  let(:group) { build(:group, user_ids: [user01.id, user02.id])}

  describe '#create' do
    context 'グループ名、メンバーが正しい場合' do
      it 'グループが作成できること' do
        expect(group).to be_valid
      end
    end
    context 'グループ名が空の場合' do
      it '保存できないこと' do
        group = build(:group, name: "", user_ids: [user01.id, user02.id])
        expect(group).to_not be_valid
      end
    end
    context 'メンバーが空の場合' do
      xit '保存できないこと' do
      end
    end
  end
end
