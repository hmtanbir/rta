require "rails_helper"

RSpec.describe MonthsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/months").to route_to("months#index")
    end

    it "routes to #new" do
      expect(:get => "/months/new").to route_to("months#new")
    end

    it "routes to #show" do
      expect(:get => "/months/1").to route_to("months#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/months/1/edit").to route_to("months#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/months").to route_to("months#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/months/1").to route_to("months#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/months/1").to route_to("months#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/months/1").to route_to("months#destroy", :id => "1")
    end
  end
end
