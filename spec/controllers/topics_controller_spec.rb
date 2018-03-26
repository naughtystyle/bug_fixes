require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:valid_attributes) {
    { name: 'topic 1' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:user) { FactoryBot.create :user }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      topic = FactoryBot.create_list :topic, 3
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      topic = FactoryBot.create :topic
      get :show, params: {id: topic.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, params: {topic: valid_attributes}
        }.to change(Topic, :count).by(1)
      end

      it "redirects to the created topic" do
        post :create, params: {topic: valid_attributes}
        expect(response).to redirect_to(Topic.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {topic: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

end
