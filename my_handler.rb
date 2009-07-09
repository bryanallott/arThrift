require 'config/boot'
require 'model/user'

require 'api_types'

class MyHandler
  def ping
    puts "Jeff Vader has been summonsed"
  end
  
  def list_all_users
    result = []
    User.all.each { |u|
      result << ArThrift::User.new(:username=>u.username, :my_status => ArThrift::Status::ACTIVE)
    }
    result
  end
  
  def add_user(username)
    User.new(:username => username).save!
    return ArThrift::User.new(:username=>username, :my_status => ArThrift::Status::INACTIVE)
  end
end
