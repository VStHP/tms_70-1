require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  subject {user}

  before { allow(controller).to receive(:current_user) { user } }

  describe "GET #index" do
    it "populates an array of contacts" do
      user = User.create(name: "ascas", email: "abc@gmail.com", password: "123123", password_confirmation: "123123")
      get :index
      assigns(:users).should eq([user])
    end
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before do
      get :show, params: {id: user.id}
    end
    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
    it "renders the #show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, params: {id: user.id}
    end
    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    it "update user success and redirect" do
      patch :update, params: { id: user.id, user:{name: "Duong ngoc tam", gender: 0} }
      expect(flash[:success]).to match(I18n.t("users.edit.update_success"))
      expect(response).to redirect_to user_path
    end
    it "update user fail and render edit" do
      patch :update, params: { id: user.id, user:{name: "", email: "abcda"} }
      expect(response).to render_template :edit
    end
  end
end

