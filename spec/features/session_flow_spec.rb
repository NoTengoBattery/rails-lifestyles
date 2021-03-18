RSpec.describe "UserSession", type: :system do
  def sing_and_test(params = {})
    fill_in I18n.t("user.user_name"), with: params[:name]
    click_button params[:button]
    expect(page).to have_selector(params[:flash_selector], text: params[:flash_text])
    expect(page).to have_selector(params[:test_selector], text: params[:test_text])
  end

  describe "sign up" do
    let (:initial_user) { FactoryBot.build(:user) }

    before do
      visit sign_up_path
    end

    it "successfully creates a user and sets the session" do
      sing_and_test(
        name: initial_user.Name,
        button: I18n.t("user.sign_up"),
        flash_selector: ".notice",
        flash_text: I18n.t("user.notice.sign_up"),
        test_selector: "#user-link-1",
        test_text: initial_user.Name
      )
    end
    it "successfully reject an invalid user" do
      sing_and_test(
        name: nil,
        button: I18n.t("user.sign_up"),
        flash_selector: ".alert",
        flash_text: I18n.t("user.alert.sign_up"),
        test_selector: "#user-link-1",
        test_text: I18n.t("user.sign_up")
      )
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
      sing_and_test(
        name: initial_user.Name,
        button: I18n.t("user.sign_in"),
        flash_selector: ".notice",
        flash_text: I18n.t("user.notice.sign_in"),
        test_selector: "#user-link-1",
        test_text: initial_user.Name
      )
    end
    it "successfully reject an invalid user" do
      sing_and_test(
        name: nil,
        button: I18n.t("user.sign_in"),
        flash_selector: ".alert",
        flash_text: I18n.t("user.alert.sign_in"),
        test_selector: "#user-link-1",
        test_text: I18n.t("user.sign_up")
      )
    end
  end
end
