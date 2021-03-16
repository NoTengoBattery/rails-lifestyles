# Dependencies

-   Ruby 3.0
-   Node.js 14 or newer

# Configuration [v0.25]

1.  Use the template and make sure to **uncheck** "Include all branches"
2.  Clone the repository to the local machine
3.  Initialize git-flow in all local machines with `git flow init`
    1.  Set production branch: `main`
    2.  Set development branch: `development`
    3.  Set the rest of the options as defaults
    4.  Initialize a new feature branch. You can call it `setup-template`
4.  Run `bundle update` to install the latest version of the gems for the project
5.  Reinstall and setup the required packages by running `bundle exec bin/setup`
6.  Generate the Rails credentials for the project: `EDITOR=true bundle exec rails credentials:edit`
7.  Change the name of the project. Use the commit [324932f](https://github.com/NoTengoBattery/rails6-ruby3-hk-ghwf-psql/commit/324932fbc5e055a3f40dbe2a565ce663f85235d7) as reference
8.  Also, do not forget to change the name and version from the `package.json` file
9.  Execute the Rubocop command, so the linter's workflow won't fail: `bundle exec rubocop -A`
10. Execute the Stylelint command, so the linter's workflow won't fail: `npx stylelint --fix "**/*.{css,scss}"`
11. Add and commit all your changes
12. Finalize your feature branch and merge your changes
13. Everything should be ready to start working!

# Code style

This template uses Rubocop and Stylelint for enforcing the code style. In the root path, there are default Rubocop and Stylelint configurations. The recommended default is for all new Rails projects in general. It uses the official and latest cops and lints for the Rails components, user code, and stylesheets.

# Notes before deploying

1.  Change the hostname for devise when deploying to production, check the files inside `config/environments`

# General notes

1.  All provided packages are already set up and ready to work and prepared for deployment using either Heroku or Mina. Note that some extra configuration is still needed. Included in this template:
    -   Mina
    -   Faker
    -   RSpec
    -   Devise
    -   Capybara
    -   Factory Bot
    -   Normalize.css
    -   Internationalization (thanks to @NoTengoBattery)
    -   Stylelint with the official SASS configuration (thanks to @NoTengoBattery)
    -   Dart SASS compiler instead of the default `node-sass`, which is severely limited
    -   Disabled `text` and `sprockets` pipelines and replaced to use Webpacker **exclusively**
    -   Rubocop with the official Rails configuration and extra enforcements (thanks to @NoTengoBattery)
    -   Mina deployment to "bare metal" servers (it's fixed to work with Puma, thanks to @NoTengoBattery)
    -   GitHub Workflows for linter enforcing and test suite (suitable for CI, thanks to @NoTengoBattery)
    -   Support for both SQLite3 and PostgreSQL
        -   SQLite3 for testing/development
        -   PostgreSQL for deploying/production
