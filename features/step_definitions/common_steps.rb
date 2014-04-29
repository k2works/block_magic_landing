# 管理ユーザー作成
def create_admin_user
  user = FactoryGirl.build(:user)
  user.skip_confirmation!
  user.save!
end
