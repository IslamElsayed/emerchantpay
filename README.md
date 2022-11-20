# README

Dependencies
* Ruby version
   3.0.0

* setup
  * `$rails db:setup`
  * `$rake 'users:import[csv_file_path]'` import users
    * a data sample can be found in `spec/support/users_sample.csv`
  * `$clockwork clock.rb` for background jobs

* for testing login with admin account `email: admin@email.com`, `paswword: 123456`
