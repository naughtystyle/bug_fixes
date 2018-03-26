require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :user }
  it { should belong_to :topic }

  it { should validate_presence_of :user }
  it { should validate_presence_of :topic }
  it { should validate_presence_of :message }

  it "Can use emoji in a comment" do
    topic = FactoryBot.create :topic
    user = FactoryBot.create :user
    comment = Comment.create topic: topic, user: user, message: "\u{1F603}"
    expect(comment.persisted?).to be_truthy
    expect(comment.message).to eq("\u{1F603}")
  end
end
