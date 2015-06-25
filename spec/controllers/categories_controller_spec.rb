require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category){Category.create!(category_name: 'New Category', sub_category: 'New sub_category')}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

 describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
      it "does edit" do
        get :edit, id: category.id
        expect(response).to have_http_status(:success)
      end

      it "doesn't edit" do
        get :edit, id: 1
        expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #show" do
    it "does show" do
      get :show, id: category.id
      expect(response).to have_http_status(:success)
    end

    it "doesn't show" do
      get :show, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    it "does create" do
      post :create, category: {category_name: 'Create Category', sub_category: 'Create Subcategory'}
      expect(response).to have_http_status(:redirect)
      expect(Category.all.count).to eq(1)
    end

    it "doesn't create" do
      post :create, category: {category_name: nil, sub_category: 'Create Subcategory'}
      expect(Category.all.count).to eq(0)
    end
  end

  describe "PUT update" do
    it "does update" do
      put :update, id: category.id, category: {category_name: 'New Category Name', sub_category: 'New Subcategory Name'}
      expect(Category.all.reload.first.category_name).to eq('New Category Name')
    end

    it "doesn't update" do
      put :update, id: category.id, category: {category_name: nil}
      expect(flash[:error]).to be_present
    end
  end

  describe "DELETE destroy" do
    it "does delete the category" do
      delete :destroy, id: category.id
      expect(Category.all.count).to eq(0)
    end

    it "doesn't delete the category" do
      delete :destroy, id: category.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
