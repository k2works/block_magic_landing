前提(/^"(.*?)"の登録が完了している$/) do |user|
  if user == "admin"
    create_admin_user
  end
end

もし(/^"(.*?)"が"(.*?)"を使ってログインした$/) do |user, pass|
  visit '/'
  click_link 'ログイン'
  fill_in 'ユーザー名', with: user
  fill_in 'パスワード', with: pass
  click_button('ログイン')
end

ならば(/^画面に"(.*?)"と表示される$/) do |message|
  expect(page).to have_content message
end
