


require 'rails_helper'


describe "Static pages" do
  subject { page }
  include Capybara::DSL
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do

    describe "Contact page" do
      before { visit about_path }
      it { should have_content('About Us') }
  
     it { should have_title("#{base_title} | About Us") }
    end
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('Contact Us') }

   it { should have_title("#{base_title} | Contact Us") }
  end
end