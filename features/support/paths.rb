module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    
    when /^the users page$/
      users_path

    when /^the edit user page for "([^\"]*)"$/
      edit_user_path(User.find_by_name($1))
       
    when /^(.*)'s profile page$/i
      user_path(User.find_by_name($1))

    when /^the edit password reset page for "([^\"]*)"$/
      edit_password_reset_path(User.find_by_name($1).password_reset_token)
      
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
