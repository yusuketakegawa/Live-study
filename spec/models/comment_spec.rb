require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "ユーザー、部屋、テキストがあれば保存できること" do
    expect(FactoryBot.build(:comment)).to be_valid
  end
  it "study_idがnilなら保存されないこと" do
    @comment = FactoryBot.build(:comment, study_id: nil)
    expect(@comment).to_not be_valid
  end
  it "user_idがnilなら保存されないこと" do
    @comment = FactoryBot.build(:comment, user_id: nil)
    expect(@comment).to_not be_valid
  end
  it "textがnilなら保存されないこと" do
    @comment = FactoryBot.build(:comment, text: nil)
    expect(@comment).to_not be_valid
  end
end
