require 'spec_helper'

describe Topic do

  def reset_topic(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @topic.destroy! if @topic
    @topic = Topic.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_topic
  end

  context "validations" do
    
    it "rejects empty title" do
      Topic.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_topic
      Topic.new(@valid_attributes).should_not be_valid
    end
    
  end
  
  context "function" do
    
    it "should get topic title" do
      topic = Topic.new(@valid_attributes.merge(:title => "hi"))
      topic.to_s.should eq(topic.title)
    end
    
    it "should find topic by title" do
      topic1 = Topic.create!(@valid_attributes.merge(:title => "topic 1"))
      Topic.by_title("topic 1").should eq([topic1])
    end
    
    it "should get topic options" do
      topic1 = Topic.create!(@valid_attributes.merge(:title => "topic 1"))
      Topic.topic_options.should eq([[@topic.title, @topic.id], [topic1.title, topic1.id]])
    end
  end

end