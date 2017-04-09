require "rails_helper"

describe Message do
  let(:message) { build(:message) }

  describe '#create' do
    context 'テキストがある場合' do
      it 'メッセージが保存できること' do
        expect(message).to be_valid
      end
    end
    context 'テキストがない場合' do
      it 'メッセージが保存できないこと' do
        message = build(:message, comment: "")
        expect(message).to_not be_valid
      end
    end
  end
end
