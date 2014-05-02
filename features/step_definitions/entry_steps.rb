前提(/^"(.*?)"である$/) do |user|
  if user == "admin"
    create_admin_user
  end
end

もし(/^"(.*?)"が"(.*?)"を登録した$/) do |user, mail|
  visit '/'
  fill_in 'mail', with: mail
  click_button('お知らせ登録')
end
