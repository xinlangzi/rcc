require 'spec_helper'

describe Article do

  def reset_article(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @article.destroy! if @article
    @article = Article.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_article
  end

  context "validations" do
    
    it "rejects empty title" do
      Article.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_article
      Article.new(@valid_attributes).should_not be_valid
    end
    
  end
  
  context "function" do
    
    it "should get topic title" do
      article = Article.new(@valid_attributes.merge(:title => "Article1"))
      article.to_s .should eq(article.title)
    end
    
    it "should return limit number of article" do
      article1 = Article.create!(@valid_attributes.merge(:title => "Article1", :position => 1))
      sleep(1)
      article2 = Article.create!(@valid_attributes.merge(:title => "Article2", :position => 2))
      Article.list(1).should eq([article2])
      Article.list(2).should eq([article2, article1])
    end
    
  end

end