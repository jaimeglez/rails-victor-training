require 'spec_helper'
require 'pry'

describe UsersController do

  let( :user_attributes ) { attributes_for(:user) }
  let( :user ) { create(:user) }

  # describe "GET #index" do
    # it "has a 200 status code" do
    #   get :index
    #   expect( response.status ).to eq( 200 )
    # end
  #   it "populates an array of users" do
  #     get :index
  #     User.all.should include user
  #   end
  #   it "renders the :index view" do
  #     get :index
  #     response.should render_template :index
  #   end
  # end

  describe "POST #create" do
    it 'creates a new user' do
      expect { post :create, { user: user_attributes } }.to change(User, :count).by(1)
    end
  end

  describe "PUT update" do
    context "valid attributes" do
      it "located the requested user" do
        put :update, id: user, user: user_attributes
        assigns(:user).should eq(user)
      end
      it "changes @user's attributes" do
        put :update, id: user, user: attributes_for(:user, username: "otroUsername")
        user.reload
        user.username.should eq("otroUsername")
      end
      it "redirects to the users path when updated user" do
        put :update, id: user, user: user_attributes
        expect(response).to redirect_to(assigns(:user))
      end
    end
    # context "invalid attributes" do
    #   it "does not change user's attributes" do
    #     username = user.username
    #     put :update, id: user, user: attributes_for(:user, username: "aaa")
    #     user.reload
    #     user.username.should eq(username)
    #   end
    # end
  end

   describe 'DELETE destroy' do
     it "deletes user" do
       expect{ delete :destroy, id: user }.to change(User, :count).by(0)
     end
     it "redirects to users#index" do
       delete :destroy, id: user
       expect(response).to redirect_to(assigns(:user))
     end
   end

end

