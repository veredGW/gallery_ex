require 'rails_helper'

RSpec.describe Article, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  before(:all) do
    @article1 = create(:article)
  end

  it "is valid with valid attributes" do
    expect(@article1).to be_valid
  end
  it "must have a headline" do
      article2 = build(:article, headline: nil)
      expect(article2).to_not be_valid
    end
end
