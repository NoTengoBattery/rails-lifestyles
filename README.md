![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby on Rails: NoTengoLifestyle [Demo]
> A "Lifestyle" website built from scratch using Ruby on Rails. It allows image uploading, user registration, and it's internationalized in several languages.

![screenshot](./public/screenshot.gif)

A demo website for a blog-like "Lifestyle" page, user registration, authorization, authentication, and internationalization. The website uses Ruby on Rails as its stacks, with `webpack`, semantic HTML, and SASS for the front-end.

## Built With
- [Ruby](https://www.ruby-lang.org/en/)
- [Ruby on Rails](https://rubyonrails.org/)
- [bootstrap](https://getbootstrap.com/)
- [sass](https://sass-lang.com/)
- [stylelint](https://stylelint.io/)
- [Gems](https://rubygems.org/)
  - [mina](https://rubygems.org/gems/mina/)
  - [http-accept](https://rubygems.org/gems/http-accept/)
  - [rails-i18n](https://rubygems.org/gems/rails-i18n/)
  - [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails/)
  - [faker](https://rubygems.org/gems/faker/)
  - [shoulda](https://rubygems.org/gems/shoulda/)
  - [capybara](https://rubygems.org/gems/capybara/)
  - [rubocop](https://rubygems.org/gems/rubocop/)

## Live Demo
Visit this demo on my website [notengobattery.com](https://lifestyle.demo.notengobattery.com/)
Video presentation on [YouTube](https://youtu.be/OKZGxJaf0ak)

## Getting Started

### Preparing the local environment
For running this program locally, you need to:
- [Install Ruby](https://www.ruby-lang.org/en/downloads/)
- [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

> Note: as discussed below, downloading the source code without `git` is possible.

Once Ruby is installed, get a copy of this project by:
- Cloning the repository using `git`
  * `git clone git@github.com:NoTengoBattery/rails-lifestyles.git`
- Downloading a zip with the source code
  * Click [here](https://github.com/NoTengoBattery/rails-lifestyles/archive/refs/heads/main.zip) to download a copy of the stable branch
  * Click [here](https://github.com/NoTengoBattery/rails-lifestyles/archive/refs/heads/development.zip) to download a copy of the development branch
  * Once  downloaded, extract it in a place with easy access to a terminal

Once Ruby is installed, and you have a copy of the source code, open the terminal and navigate to the folder where the code is:
- For Windows users, check [this](https://www.technoloxy.com/tutorials/cmd-navigate-view-run/) article.
- For UNIX/UNIX-like users such as Linux and macOS users, check [this](https://swcarpentry.github.io/shell-novice/02-filedir/index.html) article.

Install the Gems by running `bundle install`. You may need to provide your user password. For more information about Ruby's `bundle`, check [here](https://bundler.io/man/bundle-install.1.html).

Prepare the working environment by running the following command (this command does not work if you didn't install the gems as stated above): `bundle exec bin/setup`.

### Running
After following the instructions for getting started, you can execute `bundle exec rails server` for running this project. This will start the Rails server. You can visit the local demo at http://localhost:3000 (by default unless you changed the configuration).

## Authors

👤 **Oever González**

- GitHub: [@NoTengoBattery](https://github.com/NoTengoBattery)
- Twitter: [@NoTengoBattery](https://twitter.com/NoTengoBattery)
- LinkedIn: [Oever González](https://linkedin.com/in/NoTengoBattery)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NoTengoBattery/changelog-scraper/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Nelson Sakwa](https://www.behance.net/sakwadesignstudio)
- Stephenson Blake, Miller & Richard and Bauerschen Giesserei for their astonishing [Work Sans](https://fonts.google.com/specimen/Work+Sans?preview.text_type=custom#about) font family
- [Leyland Kirby](https://leylandkirby.bandcamp.com/) (a.k.a [The Caretaker](https://thecaretaker.bandcamp.com/)) for his amazing royality-free ambient music
- [Gustavo Carvalho](https://github.com/gscarv13/) for his Portuguese translations and his support

## 📝 License

This project is [X11](https://spdx.org/licenses/X11.html) licensed.
