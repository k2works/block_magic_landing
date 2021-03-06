# language: ja
機能: メールアドレス登録

  訪問ユーザーとして
  メールアドレスを登録したい
  なぜならリリース情報をいち早く連絡してもらうためだ

  シナリオアウトライン: お知らせ登録をする
    前提 "<訪問ユーザー>"である
    もし "<訪問ユーザー>"が"<メールアドレス>"を登録した
    ならば 画面に"<メッセージ>"と表示される

    例: 訪問ユーザーがお知らせ登録をする
     | 訪問ユーザー | メールアドレス | メッセージ |
     | visitor    | entry@hoge.com | 登録ありがとうございます。 |
     | visitor    | | Emailを入力してください。 |
     | visitor    | InvalidMailAddress | Emailは不正な値です。 |

  シナリオアウトライン: お知らせ登録をする
    前提 "<登録済みユーザー>"である
    もし "<登録済みユーザー>"が"<メールアドレス>"を登録した
    ならば 画面に"<メッセージ>"と表示される

    例: 登録済みユーザーがお知らせを登録する
     | 登録済みユーザー | メールアドレス | メッセージ |
     | entry    | entry@hoge.com | Emailはすでに存在します。 |
     | entry    | other_entry@hoge.com | 登録ありがとうございます。 |
     | entry    | | Emailを入力してください。 |
     | entry    | InvalidMailAddress | Emailは不正な値です。 |
