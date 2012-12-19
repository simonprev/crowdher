require "bundler/gem_tasks"
require "crowdbase"
require "pp"

task :demo do
  Crowdbase.configure do |config|
    config.client_id     = ""
    config.client_secret = ""
  end

  Crowdbase::User.sign_in!("email", "password", "subdomain")

  #Crowdbase::Search.query("test")
  @me = Crowdbase::User.me
  pp @me.notifications
end
