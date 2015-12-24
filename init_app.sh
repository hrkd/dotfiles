xcode-select --install
sudo xcodebuild -license

#vimのneobundleインストール、一度vimでコマンド実行する必要あり
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

#Homebrewのインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

brew doctor
brew install caskroom/cask/brew-cask
brew install tmux
brew install nodejs
brew install tig
brew install imagemagick
brew install postgresql
brew install mysql
brew install qt
brew install hub
brew install ansible
brew install rbenv ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

brew cask install google-chrome
brew cask install skype
brew cask install iterm2
brew cask install macvim
brew cask install virtualbox
brew cask install vagrant
brew cask install processing
brew cask install vlc
brew cask install bettertouchtool
brew cask install dropbox
brew cask install bartender
brew cask install transmit
brew cask install google-japanese-ime
brew cask install chefdk
brew cask install karabiner
brew cask install adobe-creative-cloud
brew cask install microsoft-office
brew cask install heroku-toolbelt

#chef
sudo chef gem install knife-solo

#dotfilesを表示
defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder

sudo gem install tmuxinator
sudo gem install bundler
sudo gem install rails
sudo gem install compass
sudo gem install mysql2 -v '0.3.17'
sudo gem install execjs

sudo npm install -g gulp
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g yo
sudo npm install -g generator-angular
