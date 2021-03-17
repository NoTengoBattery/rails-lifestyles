RSpec.describe "Navigation", type: :system do
  describe "link" do
    def sign_up_rutine
      user = FactoryBot.build(:user)
      visit sign_up_path
      fill_in I18n.t("user.user_name"), with: user.Name
      click_button I18n.t("user.sign_up")
      User.find_by(Name: user.Name)
    end
    before do
      visit root_path
    end
    it "shows the brand link" do
      brand = find(".navbar-brand")
      expect(brand.text).to eq(I18n.t("name"))
      expect(brand["href"]).to eq(root_path)
    end
    it "shows the home link" do
      home = find(".nav-link#home")
      expect(home.text).to eq(I18n.t("home"))
      expect(home["href"]).to eq(root_path)
    end
    it "shows the write new article link" do
      write = find(".nav-link#write")
      expect(write.text).to eq(I18n.t("article.write"))
      expect(write["href"]).to eq(new_article_path)
    end
    it "shows the sign up link when guest" do
      sign_up = find(".nav-link#user-link-1")
      expect(sign_up.text).to eq(I18n.t("user.sign_up"))
      expect(sign_up["href"]).to eq(sign_up_path)
    end
    it "shows the sign in link when guest" do
      sign_in = find(".nav-link#user-link-2")
      expect(sign_in.text).to eq(I18n.t("user.sign_in"))
      expect(sign_in["href"]).to eq(sign_in_path)
    end
    it "shows the self user profile link when signed in" do
      user = sign_up_rutine
      user_profile = find(".nav-link#user-link-1")
      expect(user_profile.text).to eq(user.Name)
      expect(user_profile["href"]).to eq(user_path(user.id))
    end
    it "shows the sign out link when signed in" do
      sign_up_rutine
      sign_out = find(".nav-link#user-link-2")
      expect(sign_out.text).to eq(I18n.t("user.sign_out"))
      expect(sign_out["href"]).to eq(sign_out_path)
    end
  end
end
