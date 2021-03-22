def sign_up_rutine
  user = FactoryBot.build(:user)
  visit sign_up_path
  fill_in I18n.t("user.user_name"), with: user.Name
  click_button I18n.t("user.sign_up")
  User.find_by(Name: user.Name)
end
