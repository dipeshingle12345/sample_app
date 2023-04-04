


require 'rails_helper'


describe "Static pages" do
  subject { page }
  include Capybara::DSL
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit root_path
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

      before { visit about_path }
      let(:heading)    { 'About Us' }
      let(:page_title) { 'About Us' }
   
      it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
   


   let(:heading)    { 'Contact Us' }
   let(:page_title) { 'Contact Us' }

   it_should_behave_like "all static pages"

  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))

    click_link "Contact"
    expect(page).to have_title(full_title("Contact Us"))
  end
  

end