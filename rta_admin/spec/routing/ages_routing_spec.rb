require "rails_helper"

RSpec.describe AgesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ages").to route_to("ages#index")
    end

    it "routes to #new" do
      expect(:get => "/ages/new").to route_to("ages#new")
    end

    it "routes to #show" do
      expect(:get => "/ages/1").to route_to("ages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ages/1/edit").to route_to("ages#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ages").to route_to("ages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ages/1").to route_to("ages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ages/1").to route_to("ages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ages/1").to route_to("ages#destroy", :id => "1")
    end
  end
end
