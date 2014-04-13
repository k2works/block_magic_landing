スモークテスト支援ツール
===================

# 目的
スモークテストでMVP作成を支援することを目的とする

# 前提
| ソフトウェア   | バージョン   | 備考        |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| ruby           |2.0.0         |             |
| rvm            |1.24.0        |             |
| rbricks        |2.0.5         |             |
| heroku-toolbelt |3.6.0        |             |

+ [Herokuにサインアップしている](https://id.heroku.com/signup/devcenter)
+ [Heroku Toolbeltをインストールしている](https://toolbelt.heroku.com/)
+ [LiveReloadをChromeにインストールしている](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)

# 構成
+ [環境セットアップ](#1)
+ [アプリケーションのセットアップ](#2)
+ [アプリケーションのデプロイ](#3)
+ [その他追加設定](#4)

# 詳細

## <a name="1">環境セットアップ</a>

```bash
$ rvm install ruby-2.0.0-p247
$ rvm use ruby-2.0.0
$ rvm gemset create github
$ rvm use ruby-2.0.0@github
$ gem install railsbricks
$ gem install rails --version=4.0.4
```
## <a name="2">アプリケーションのセットアップ</a>

### 基本セットアップ

```bash
$ git clone https://github.com/LeanEC/mvp_smoke_tester.git
$ bundle
$ rake db:migrate
$ rake db:seed
$ rails s
```

### 日本語対応
Gemfile編集
```
gem 'i18n_generators'
```
日本語ファイル生成
```
$ bundle
$ rails g i18n ja
```
モデルの日本語対応  
_config/locales/translation_ja.yml_
```yml
ja:
  activerecord:
    models:
      user: ユーザー

    attributes:
      user:
        admin: 管理者
        email: eメール
        username: ユーザー名
        password: パスワード
        password_confirmation: パスワード再確認
        current_password: 現在のパスワード
```

### RSpec対応
#### Gemfile編集
```
group :test, :development do
  gem "rspec-rails", '~> 2.14.1'
  gem "guard-rspec"
  gem "factory_girl_rails"
  gem "spring"
  gem "guard-livereload", require: false
  gem "spring-commands-rspec"
end
```
#### FactoryGirlの設定  
_spec/spec_helper.rb_の最後に以下を追加
```ruby
config.before(:all) do
  FactoryGirl.reload
end
```
#### Guardの設定
```bash
$ guard init rspeclivereload
```
生成されたGuardfileから以下の行を変更する

変更前
```
guard :rspec do
```
変更後
```
guard :rspec, cmd: 'spring rspec -f doc' do
```

### Cucumber対応
#### Gemfile編集
```ruby
group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "guard-cucumber"
end
```
Capybaraのsave_and_open_page実行時にブラウザに出力するようにする
```ruby
group :test do
  gem "capybara", '~> 2.2.1'
  gem "launchy"
end
```
#### Cucumberセットアップ
```bash
$ bundle
$ rails g cucumber:install
$ rake cucumber
```
#### Guardファイル追加
```bash
$ guard init cucumber
```

## <a name="">アプリケーションのデプロイ</a>
### WebサーバーをUnicornに変更する
#### Gemfile編集
```ruby
gem 'unicorn'
```
#### 設定ファイル作成
```bash
$ bundle
$ touch config/unicorn.rb
```
_config/unicorn.rb_
```ruby
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
```
### Heroku準備
#### Procfileの作成
_Procfile_
```
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
```
#### .envファイルの追加
```bash
$ echo "RACK_ENV=development" >>.env
$ echo "PORT=3000" >> .env
$ echo ".env" >> .gitignore
```

#### foreman実行
```bash
$ gem install foreman
$ foreman start
```

### Herokuへデプロイ
```bash
$ heroku login
$ heroku create --addons heroku-postgresql
$ git push heroku master

### Herokuデーターベースマイグレーション
```bash
$ heroku run rake db:migrate
$ heroku run rake db:seed
```

### Herokuアプリケーションの確認
```bash
$ heroku ps:scale web=1
$ heroku ps
$ heroku open
```
### Herokuアプリケーションの名前変更
```bash
$ heroku apps:rename mvp-smoke-tester
```

## <a name="4">その他追加設定</a>

### Guardもforemanから呼び出すように変更
_Procfile_
```
guard: bundle exec guard
```
