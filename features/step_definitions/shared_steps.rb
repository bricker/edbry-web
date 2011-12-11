Then /^there should be ([0-9]+) ([\w ]+)$/ do |count, record|
  record.gsub(/\s/, "_").classify.constantize.count.should == count.to_i
end