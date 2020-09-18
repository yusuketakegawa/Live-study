require 'rails_helper'

RSpec.describe StudiesController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @study = FactoryBot.create(:study)
  end

  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    context "as an authenticated user" do
      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @study.id }
        expect(response).to be_successful
      end

      it "returns a 200 response" do
        sign_in @user
        get :show, params: { id: @study.id }
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :show, params: { id: @study.id }
        expect(response).to have_http_status "302"
      end
      it "redirect to the sign-in page" do
        get :show, params: { id: @study.id }
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#new" do
    context "as an authorized user" do
      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_successful
      end
      it "returns a 200 response" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end
    context "as a guest user" do
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_successful
      end
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "redirects the page to root_path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      it "create study" do
        study_params = FactoryBot.attributes_for(:study)
        sign_in @user
        expect do
          post :create, params: { study: study_params }
        end.to change(@user.created_studies, :count).by(1)
      end
    end
    context "as a guest user" do
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_successful
      end
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "redirects the page to root_path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#update" do
    before do
      @user = FactoryBot.create(:user)
      @study = FactoryBot.create(:study, owner: @user)
    end
    context "as an authorized user" do
      it "update study" do
        study_params = FactoryBot.attributes_for(:study, name: "新しい勉強部屋")
        sign_in @user
        patch :update, params: { id: @study.id, study: study_params }
        expect(@study.reload.name).to eq "新しい勉強部屋"
      end
    end
    context "as a guest user" do
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_successful
      end
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "redirects the page to root_path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#destroy" do
    before do
      @user = FactoryBot.create(:user)
      @study = FactoryBot.create(:study, owner: @user)
    end
    context "as an authorized user" do
      it "delete study" do
        sign_in @user
        expect do
          delete :destroy, params: { id: @study.id }
        end.to change(@user.created_studies, :count).by(-1)
      end
    end
    context "as a guest user" do
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_successful
      end
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "redirects the page to root_path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end
end
