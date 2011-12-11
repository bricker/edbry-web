When /^I fill out the post form$/ do
  fill_in "post_title", with: "Blog Post"
  fill_in "post_content", with: "Lorem Ipsum"
end

When /^I fill out the post form with empty fields$/ do
  fill_in "post_title", with: ""
  fill_in "post_content", with: ""
end

When /^a post$/ do
  @post = Factory(:post)
end