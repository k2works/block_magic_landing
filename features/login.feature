# language: ja
機能: ログイン

  管理ユーザーとして
  ログインしたい
  なぜなら管理ユーザーだけに許可された作業をするためだ

  シナリオアウトライン: 管理ユーザーとしてログインする
    前提 "<管理ユーザー>"の登録が完了している
    もし "<管理ユーザー>"が"<パスワード>"を使ってログインしたら
    ならば 画面に"<画面メッセージ>"と表示される

    例: 管理ユーザーがログインする
      | 管理ユーザー | パスワード | 画面メッセージ |
      | admin      | 1234    | ログインしました |
      | admin      | 0000    | メールアドレスかパスワードが違います。 |

    例: 管理ユーザー以外がログインする
      | 管理ユーザー | パスワード | 画面メッセージ |
      | not_admin      | 1234    | メールアドレスかパスワードが違います。|
      | not_admin      | 0000    | メールアドレスかパスワードが違います。|