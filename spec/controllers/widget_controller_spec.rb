require 'rails_helper'

describe WidgetController do

  describe '#Index' do
    before do
      get_all_widgets # stub the request
    end

    it "returns widget for all users" do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#Edit' do
    context "when the use in not logged in" do
      before do
        edit_widget
      end

      it "redirect the user" do
        get :edit, params: { id: 2}
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the user is logged in" do
      before do
          session[:token] = '9a1a433fec9ee269526c00216c78bfb92978'
          allow_any_instance_of(ApplicationController).to receive(:authorise).and_return(session[:token])
          edit_widget
      end
      it "returns a widget with the params id if exits" do
        get :edit, params: { id: 2}
        expect(response).to be_successful
      end
    end
  end


  describe '#Create' do

    let(:wrong_widget) { {
                        name: "A Hidden Widget",
                        description: "Widget 1",
                        kind: "hidden"
                      }
                  }

      let(:widget) { {
        name: "A Hidden Widget and this is working for me oh",
        description: "Yes this is working for me oh and very nice",
        kind: "hidden"}
      }
    
    context "when a user what to create a widget" do
      context "and the user ia not logged in" do
      

        it "redirect the user to the root path" do
          post :create, params: wrong_widget
          expect(response).to redirect_to(root_path)
        end
      end

      context "when the user is logged in" do
        before do
            session[:token] = '9a1a433fec9ee269526c00216c78bfb92978'
            allow_any_instance_of(ApplicationController).to receive(:authorise).and_return(session[:token])
            create_widget
        end

        context "and input wrong params lenght" do
          it "returns a widget with the params id if exits" do
            post :create, params:  wrong_widget

            expect(response.status).to eq 400
            expect(JSON.parse(response.body)['description']).to eq ["is too short (minimum is 20 characters)"]
          end
        end

        context "and input right params lenght" do
          it "returns a widget with the params id if exits" do
            post :create, params: widget
            expect(response).to redirect_to(user_widget_path)
          end
        end
      end
    end
  end


   describe '#Delete' do
      context "when the user is logged in" do
        before do
            session[:token] = '9a1a433fec9ee269526c00216c78bfb92978'
            allow_any_instance_of(ApplicationController).to receive(:authorise).and_return(session[:token])
            delete_widget
        end
        context "and deletes a widget" do
          it "redirect to user path" do
            delete :delete, params: {id: 1}
            expect(response).to redirect_to(user_widget_path)
          end
        end
      end
  end
end

