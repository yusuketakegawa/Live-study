require 'rails_helper'

RSpec.describe Message, type: :model do
  it "ユーザー、部屋、テキストがあれば保存できること" do
    expect(FactoryBot.build(:message)).to be_valid
  end
  it "user_idがnilなら保存されないこと" do
    @comment = FactoryBot.build(:message, user_id: nil)
    expect(@comment).to_not be_valid
  end
end
