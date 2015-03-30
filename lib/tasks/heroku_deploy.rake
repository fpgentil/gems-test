namespace :deploy do
  task :heroku do
    puts "Running specs before uploading to Heroku..."
    task = system "rspec ."
    if task
      puts "=> Server entering maintenance mode"
      system "heroku maintenance:on"
      puts "=> Deploying to Heroku"
      success = system "git push https://git.heroku.com/gems-test.git master"
      if success
        puts "Migrating database"
        system "heroku run rake db:migrate"
        puts "=> Clearing cache"
        system "heroku run rake cache:clear"
      else
        puts "=> Deployment failed"
      end
      puts "=> Staging server leaving maintenance mode"
      system "heroku maintenance:off"
      puts "=> Restarting app"
      system "heroku restart"
      puts "Finished staging deployment..."
    else
      puts "=> One or more test failed, please check them before pushing!"
    end
  end
end
