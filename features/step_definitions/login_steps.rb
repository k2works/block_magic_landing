前提(/^"(.*?)"の登録が完了している$/) do |user|
  if user == "admin"
    user = FactoryGirl.build(:user)
    user.skip_confirmation!
    user.save!
  end
end

もし(/^"(.*?)"が"(.*?)"を使ってログインしたら$/) do |user, pass|
  visit '/'
  click_link 'ログイン'
  fill_in 'ユーザー名', with: user
  fill_in 'パスワード', with: pass
  click_button('ログイン')
end

ならば(/^管理画面に移動して"(.*?)"と表示される$/) do |message|
  expect(page).to have_content message
end
