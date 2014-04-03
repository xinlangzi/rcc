Given /^I have no ads$/ do
  Ad.delete_all
end

Given /^I (only )?have ads titled "?([^\"]*)"?$/ do |only, titles|
  Ad.delete_all if only
  titles.split(', ').each do |title|
    Ad.create(:link => title)
  end
end

Then /^I should have ([0-9]+) ads?$/ do |count|
  Ad.count.should == count.to_i
end
