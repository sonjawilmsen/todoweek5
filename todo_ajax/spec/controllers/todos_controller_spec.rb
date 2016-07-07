require 'rails_helper'

describe TodosController do
  describe "GETS #index" do

    it "GETS index" do
      get :index
      expect(response).to be_success
      expect(response). to render_template("index")
    end
  end
end
