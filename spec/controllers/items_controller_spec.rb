require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:item){Item.create(item_name: 'this here item', item_price: 9.99)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "shows" do
      get :show, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "no shows" do
      get :show, id: 499
      expect(flash[:error]).to be_present
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "edit" do
      get :edit, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "no edit" do
      get :edit, id: 499
      expect(flash[:error]).to be_present
    end
  end

  describe "POST #create" do
    it "creates" do
      post :create, item: {item_name: 'Name', item_price: 9.99}
      expect(response).to have_http_status(:redirect)
      expect(Item.all.count).to eq(1)
    end

    it "no create" do
      post :create, item: {item_name: nil, item_price: 9.99}
      expect(Item.all.count).to eq(0)
    end
  end

  describe "PUT #update" do
    it "updates" do
      put :update, id: item.id, item: {item_name: 'new name', item_price: '8.31'}
      expect(Item.all.reload.first.item_name).to eq('new name')
    end

    it "no update" do
      put :update, id: item.id, item: {item_name: nil}
      expect(flash[:error]).to be_present
    end
  end

  describe "DELETE #destroy" do
    it "it deletes" do
      delete :destroy, id: item.id
      expect(Item.all.count).to eq(0)
    end

    it "no delete" do
      delete :destroy, id: 499
      expect(flash[:error]).to be_present
    end
  end

end
