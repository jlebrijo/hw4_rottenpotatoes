Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

When /^(?:|I )go to the edit page for "([^"]*)"$/ do |title|
  visit edit_movie_path(Movie.find_by_title(title))
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |film, director|
  step %Q{I should see "#{director}"}
end

Given /^I am on the details page for "([^"]*)"$/ do |title|
  visit movie_path(Movie.find_by_title(title))
end

Then /^I should be on the Similar Movies page for "([^"]*)"$/ do |title|
  step %Q{I should see "#{title}"}
end