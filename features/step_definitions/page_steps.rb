When /^I fill out the page form$/ do
  fill_in "page_text_id", with: "page_title"
  fill_in "page_title", with: "Page Title"
  fill_in "page_content", with: "Page Content"
end

When /^I fill out the page form with empty fields$/ do
  #fill_in "page_text_id", with: "" # Causes an error
  fill_in "page_title", with: ""
  fill_in "page_content", with: ""
end

When /^a page$/ do
  @page = Factory(:page)
end