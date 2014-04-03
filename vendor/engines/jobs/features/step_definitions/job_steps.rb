Given /^I have no jobs$/ do
  Job.delete_all
end

Given /^I (only )?have jobs titled "?([^\"]*)"?$/ do |only, titles|
  Job.delete_all if only
  titles.split(', ').each do |title|
    Job.create(:title => title)
  end
end

Then /^I should have ([0-9]+) jobs?$/ do |count|
  Job.count.should == count.to_i
end
