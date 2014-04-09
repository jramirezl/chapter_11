require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('a',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end


  describe "Home page" do
    before { visit home_path }
    let(:heading)    { 'sample app' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "micropost pagination and count" do
    let(:user) { FactoryGirl.create(:user) }

    describe "test pluralization with single" do
      before { visit root_path }
      it { should_not have_selector('span',    text: "microposts") }
      it { page.should_not have_selector('div.pagination') }

    end

    describe "test pluralization with 31 and pagination" do
      before do
        31.times { FactoryGirl.create(:micropost, user: user) }
        sign_in user
        visit root_path
      end
      it { should have_selector('span',    text: "31") }
      it { should have_selector('span',    text: "microposts") }
      it { page.should have_selector('div.pagination') }

    end

  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'sample app' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"

  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'sample app' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"

  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'sample app' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"

  end


  it "should have the right links on the layout" do
    visit home_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should # fill in
    click_link "Contact"
    page.should # fill in
    click_link "Home"
    click_link "Sign up now!"
    page.should # fill in
    click_link "sample app"
    page.should # fill in
  end

end