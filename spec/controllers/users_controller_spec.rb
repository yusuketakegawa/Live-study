require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe "show" do
    context "as an authenticated user" do
      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @user2.id }
        expect(response).to be_successful
      end

      it "returns a 200 response" do
        sign_in @user
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status "302"
      end
      it "redirect to root_path" do
        get :show, params: { id: @user2.id }
        expect(response).to redirect_to root_path
      end
    end
  end
  describe "edit" do
    context "as an authenticated user" do
      it "responds successfully" do
        sign_in @user
        get :edit, params: { id: @user.id }
        expect(response).to be_successful
      end

      it "returns a 200 response" do
        sign_in @user
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :edit, params: { id: @user2.id }
        expect(response).to have_http_status "302"
      end
      it "redirect to root_path" do
        get :edit, params: { id: @user2.id }
        expect(response).to redirect_to root_path
      end
    end
  end
  describe "updte" do
    context "as an authenticated user" do
      it "responds successfully" do
        user_params = FactoryBot.attributes_for(:user, nickname: "update")
        sign_in @user
        get :update, params: { id: @user.id, user: user_params }
        expect(@user.reload.nickname).to eq "update"
      end
      it "dose not update" do
        user_params = FactoryBot.attributes_for(:user, nickname: "update")
        sign_in @user
        get :update, params: { id: @user2.id, user: user_params }
        expect(@user2.reload.nickname).to_not eq "update"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :update, params: { id: @user2.id }
        expect(response).to have_http_status "302"
      end
      it "redirect to root_path" do
        get :update, params: { id: @user2.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end
