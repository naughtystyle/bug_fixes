require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many :comments }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it "Can gracefully handle an attempt to add a name with too many characters" do
    name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    topic = Topic.create name: name
    expect(topic.persisted?).to be_falsy
    expect(topic.name).to eq(name)
  end
end
