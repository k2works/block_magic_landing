# 管理ユーザー作成
def create_admin_user
  user = FactoryGirl.build(:user)
  user.skip_confirmation!
  user.save!
end
# メールアドレス登録済みユーザー作成
def create_entry_user
  FactoryGirl.create(:entry)
end
