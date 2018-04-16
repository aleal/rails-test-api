# README

## Setup

```
cd <project-folder>
rbenv install 2.3.5
rbenv local 2.3.5
gem install bundler
bundle install
rails db:create
rails db:migrate
rails test
rails s
```

Note: you should change postgresql user at config/database.yml. Or, if you will, add user aleal to your database.
