前提(/^"(.*?)"である$/) do |user|
  case user
  when "admin"
    create_admin_user
  when "entry"
    create_entry_user
  end
end

もし(/^"(.*?)"が"(.*?)"を登録した$/) do |user, mail|
  visit '/'
  fill_in 'entry_email', with: mail
  click_button('お知らせ登録')
end
