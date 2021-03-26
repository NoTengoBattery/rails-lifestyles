![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby on Rails: NoTengoStyle [Demo]

> A "Lifestyle" website built from scratch using Ruby on Rails. It allows image uploading, user registration, and it's internationalized in several languages.

![screenshot](./doc/screenshot.gif)

A demo website for a blog-like "Lifestyle" page with user registration, authorization, authentication, and internationalization. The website uses Ruby on Rails with PostgreSQL as the back-end stack, with `webpack`, semantic HTML, and SASS for the front-end.

## Built With

-   [Ruby on Rails](https://rubyonrails.org/)
-   [Ruby](https://www.ruby-lang.org/en/)
-   [bootstrap](https://getbootstrap.com/)
-   [sass](https://sass-lang.com/)
-   [stylelint](https://stylelint.io/)
-   [Gems](https://rubygems.org/)
    -   [capybara](https://rubygems.org/gems/capybara/)
    -   [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails/)
    -   [faker](https://rubygems.org/gems/faker/)
    -   [http-accept](https://rubygems.org/gems/http-accept/)
    -   [mina](https://rubygems.org/gems/mina/)
    -   [rails-i18n](https://rubygems.org/gems/rails-i18n/)
    -   [rubocop](https://rubygems.org/gems/rubocop/)
    -   [shoulda](https://rubygems.org/gems/shoulda/)

## Live Demo

Visit this demo on my website [notengobattery.com](https://lifestyle.demo.notengobattery.com/)

Check the video presentation on [YouTube](https://youtu.be/GATarBv2JLc/)

## Getting Started

### Preparing the local environment

For running this program locally, please:

-   [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/)
-   [Install Ruby 3.0](https://www.ruby-lang.org/en/downloads/)
-   [Install node.js](https://nodejs.org/en/download/)
-   [Install `yarn` globally](https://docs.npmjs.com/downloading-and-installing-packages-globally/)
-   [Install GraphicsMagic](http://www.graphicsmagick.org/README.html/)

> Note: as discussed below, downloading the source code without `git` is possible.

Once git is installed, get a copy of this project by one of the following methods:

-   By cloning the repository using `git`
    -   `git clone git@github.com:NoTengoBattery/rails-lifestyles.git`
-   By downloading a zip with the source code
    -   Click [here](https://github.com/NoTengoBattery/rails-lifestyles/archive/refs/heads/main.zip) to download a copy of the stable branch
    -   Extract it in a place with easy access to a terminal

When Ruby 3.0, GraphicsMagic and Node.js are installed, and you have a copy of the source code, open the terminal and navigate to the folder where the code is. If you need help navigating using the terminal, please check the following articles:

-   For Windows users, check [this](https://www.technoloxy.com/tutorials/cmd-navigate-view-run/) article.
-   For UNIX/UNIX-like users such as Linux and macOS users, check [this](https://swcarpentry.github.io/shell-novice/02-filedir/index.html) article.

> Note: the following commands should be executed in the project's root directory.

Install the dependencies by running `bundle install`. There may be need for providing the administrator password. For more information about Ruby's `bundle` tool, please check [here](https://bundler.io/man/bundle-install.1.html).

Prepare the working environment by running the following command: `bundle exec bin/setup`. That command will automatically set up the development environment and finish the installation of the Node.js dependencies.

### Running

After following the instructions for getting started, execute `bundle exec rails server` for running this project. This will start the Rails server. Visit the local demo at <http://localhost:3000> (by default).

#### Running the tests

Running the tests is similar to running the server. For this, `bundle` is **required**. Run the test suite by issuing the following command: `bundle exec rspec`.

## Authors

👤 **Oever González**

-   GitHub: [@NoTengoBattery](https://github.com/NoTengoBattery/)
-   Twitter: [@NoTengoBattery](https://twitter.com/NoTengoBattery/)
-   LinkedIn: [Oever González](https://linkedin.com/in/NoTengoBattery/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NoTengoBattery/rails-lifestyles/issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

-   [Nelson Sakwa](https://www.behance.net/sakwadesignstudio)
-   Stephenson Blake, Miller & Richard and Bauerschen Giesserei for their astonishing [Work Sans](https://fonts.google.com/specimen/Work+Sans?preview.text_type=custom#about) font family
-   [Leyland Kirby](https://leylandkirby.bandcamp.com/) (a.k.a [The Caretaker](https://thecaretaker.bandcamp.com/)) for his amazing royality-free ambient music
-   [Gustavo Carvalho](https://github.com/gscarv13/) for his Portuguese translations and his support

## 📝 License

This project is [MIT-modified](./LICENSE) licensed.
