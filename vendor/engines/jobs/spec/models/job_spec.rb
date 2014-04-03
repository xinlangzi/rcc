require 'spec_helper'

describe Job do

  def reset_job(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @job.destroy! if @job
    @job = Job.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_job
  end

  context "validations" do
    
    it "rejects empty title" do
      Job.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_job
      Job.new(@valid_attributes).should_not be_valid
    end
    
  end
  
  context "function" do
    it "should return limit number of jobs" do
      job1 = Job.create!(@valid_attributes.merge(:title => "job1", :position => 1))
      job2 = Job.create!(@valid_attributes.merge(:title => "job2", :position => 2))
      job3 = Job.create!(@valid_attributes.merge(:title => "job3", :position => 3))
      Job.list(1).should eq([job1])
      Job.list(2).should eq([job1, job2])
    end
  end

end