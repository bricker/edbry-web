module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    #### GENERAL ####
    when /^the home\s?page$/
      '/'
    
    
    #### POSTS ####
    when /^the post's page$/
      post_path(Post.last)
    
    when /^the posts page$/
      posts_path
      
    when /^the edit page for the post$/
      edit_post_path(@post)
       
    
    #### PAGES ####
    when /^the page's page$/
      view_page_path(Page.last)

    when /^the edit page for the page$/
      edit_page_path(@page)
        
        
    #### USERS ####
    when /^the users page$/
      users_path

    when /^the edit user page for "([^\"]*)"$/
      edit_user_path(User.find_by_name($1))
       
    when /^(.*)'s profile page$/i
      user_path(User.find_by_name($1))


    #### PASSWORD RESET ####
    when /^the edit password reset page for "([^\"]*)"$/
      edit_password_reset_path(User.find_by_name($1).password_reset_token)
      
    when /^the reset password page e-mailed to me$/
      edit_password_reset_path(@me.password_reset_token)
      
    when /^the forgot password page$/
      new_password_reset_path
    
    when /^the reset password page with an invalid token$/
      edit_password_reset_path("invalid_token")
          
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
