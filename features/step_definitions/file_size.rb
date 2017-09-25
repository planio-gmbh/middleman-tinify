Then(/^the file "([^"]*)" should have (\d+) bytes$/) do |file, size|
  expect(File.size(File.join(expand_path("."), file))).to eq size.to_i
end
