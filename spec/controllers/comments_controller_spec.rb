require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:topic) { FactoryBot.create :topic }

  let(:valid_attributes) {
    { message: 'hello', topic_id: topic.id }
  }

  let(:invalid_attributes) {
    { message: '', topic_id: topic.id }
  }

  let(:user) { FactoryBot.create :user }

  before(:each) do
    sign_in user
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the topic of the created comment" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to(topic)
      end
    end

    context "with invalid params" do
      it "redirects to the topic" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to(topic)
      end
    end
  end

end
