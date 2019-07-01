# README

* Ruby version: 2.5.1

* Rails version: 5.2.3

# INSTALLATION STEPS
1. Run bundle
`bundle install`

2. Prepare config files
`Copy config/database.yml.template to config/database.yml`
`!!! Make sure you rename username and password with your own !!!`

3. Database
`rails db:create`
`rails db:migrate`

4. Fill administrator data into database
`rails populate`

5. Start server
`rails s`
