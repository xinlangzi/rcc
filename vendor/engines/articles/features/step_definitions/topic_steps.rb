Given /^I have no topics$/ do
  Topic.delete_all
end

Given /^I (only )?have topics titled "?([^\"]*)"?$/ do |only, titles|
  Topic.delete_all if only
  titles.split(', ').each do |title|
    Topic.create(:title => title)
  end
end

Then /^I should have ([0-9]+) topics?$/ do |count|
  Topic.count.should == count.to_i
end
