RSpec.describe "UserSession", type: :system do
  describe "sign up" do
    let (:initial_user) { FactoryBot.build(:user) }
    before do
      visit sign_up_path
    end
    it "successfully creates a user and sets the session" do
      fill_in I18n.t("user.user_name"), with: initial_user.Name
      click_button I18n.t("user.sign_up")
      expect(page).to have_selector(".notice", text: I18n.t("user.notice.sign_up"))
      expect(page).to have_selector(".nav-link#user-link-1", text: initial_user.Name)
    end
    it "successfully reject an invalid user" do
      fill_in I18n.t("user.user_name"), with: nil
      click_button I18n.t("user.sign_up")
      expect(page).to have_selector(".alert", text: I18n.t("user.alert.sign_up"))
      expect(page).to have_selector(".nav-link#user-link-1", text: I18n.t("user.sign_up"))
    end
  end
  describe "sign up" do
    let (:initial_user) { FactoryBot.build(:user) }
    before do
      visit sign_up_path
      fill_in I18n.t("user.user_name"), with: initial_user.Name
      click_button I18n.t("user.sign_up")
      Capybara.reset_sessions!
      visit sign_in_path
    end
    it "successfully signs in as a user and sets the session" do
      fill_in I18n.t("user.user_name"), with: initial_user.Name
      click_button I18n.t("user.sign_in")
      expect(page).to have_selector(".notice", text: I18n.t("user.notice.sign_in"))
      expect(page).to have_selector(".nav-link#user-link-1", text: initial_user.Name)
    end
    it "successfully reject an invalid user" do
      fill_in I18n.t("user.user_name"), with: nil
      click_button I18n.t("user.sign_in")
      expect(page).to have_selector(".alert", text: I18n.t("user.alert.sign_in"))
      expect(page).to have_selector(".nav-link#user-link-1", text: I18n.t("user.sign_up"))
    end
  end
end
