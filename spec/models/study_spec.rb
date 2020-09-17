require 'rails_helper'

RSpec.describe Study, type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:study)).to be_valid
  end
  it "部屋名が51文字以上なら保存されないこと" do
    @study = FactoryBot.build(:study, name: "a" * 51)
    expect(@study).to_not be_valid
  end
  it "部屋の説明が301文字以上なら保存されないこと" do
    @study = FactoryBot.build(:study, introduce: "a" * 301)
    expect(@study).to_not be_valid
  end
  it "終了時間がないと保存されないこと" do
    @study = FactoryBot.build(:study, end_at: nil)
    expect(@study).to_not be_valid
  end
  it "ツールが選択されてないと保存さあれないこと" do
    @study = FactoryBot.build(:study, tool_id: nil)
    expect(@study).to_not be_valid
  end
  it "カテゴリーが選択されていないと保存されないこと" do
    @study = FactoryBot.build(:study, category_id: nil)
    expect(@study).to_not be_valid
  end
  it "urlが正しい形でないと保存されないこと" do
    @study = FactoryBot.build(:study, url: "ttps://us04web.zoom.us/j/4336842031?pwd=aFIvTkpDNCtSa3c1dEl3M1JZcVovZz09" )
    expect(@study).to_not be_valid
  end
  it "開催してるホストがいないと保存されないこと" do
    @study = FactoryBot.build(:study, owner_id: nil)
    expect(@study).to_not be_valid
  end

  

end
