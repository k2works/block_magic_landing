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

# 構成
+ [環境セットアップ](#1)
+ [アプリケーションのセットアップ](#2)
+ [BDD環境のセットアップ](#3)
+ [アプリケーションのデプロイ](#4)

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
