require 'spec_helper'

describe Ad do

  def reset_ad(options = {})
    @valid_attributes = {
      :id => 1,
      :link => "RSpec is great for testing too",
      :image => Image.new
    }

    @ad.destroy! if @ad
    @ad = Ad.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_ad
  end

  context "validations" do
    
    it "rejects empty link" do
      Ad.new(@valid_attributes.merge(:link => "")).should_not be_valid
    end
    
    it "rejects empty image" do
      Ad.new(@valid_attributes.merge(:image => nil)).should_not be_valid
    end

    it "rejects non unique link" do
      # as one gets created before each spec by reset_ad
      Ad.new(@valid_attributes).should_not be_valid
    end
    
  end
  
  context "function" do
    it "should return limit number of ads" do
      ad1 = Ad.create!(@valid_attributes.merge(:link => "hi", :position => 1))
      ad2 = Ad.create!(@valid_attributes.merge(:link => "hi 2", :position => 2))
      Ad.list(1).should eq([ad1])
      Ad.list(2).should eq([ad1, ad2])
      ad3 = Ad.create!(@valid_attributes.merge(:link => "hi 3", :position => 5))
      ad4 = Ad.create!(@valid_attributes.merge(:link => "hi 4", :position => 0))
      Ad.list(1).should eq([ad4])
      Ad.list(2).should eq([ad4, ad1])
    end
  end

end