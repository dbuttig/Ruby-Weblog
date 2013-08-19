Given "I am not logged in" do
end

Given "I am logged in" do
  @author = Author.new(name: "Test Man")
  @author.password = @author.password_confirmation = "Funjet17"
  @author.save!
  visit "/session/new"
  fill_in :name, with: "Test Man"
  fill_in :password, with: "Funjet17"
  click_on "Log in"
end

When "I go to create a new post" do
  visit "/posts/new"
end

When "I create a new post" do
  visit "/posts/new"
  fill_in "Title", with: "Title"
  fill_in "Text", with: "awesome"
  click_on "Create Post"
end

Then "I am asked to log in" do
  page.should have_content("Please log in")
end

Then "the post is shown" do
  page.should have_content "Text: awesome"
end
