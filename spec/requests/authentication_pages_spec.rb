require 'spec_helper'

describe "Authentication Pages" do
  subject { page }
  
  describe "signin page" do
  	before { visit signin_path }
  	it { should have_title('Ingresar') }
    it { should have_selector('h1', text: 'Ingresar') }
  end

  describe "signin" do
  	before { visit signin_path }
  	describe "with invalid information" do
  		before { click_button 'Ingresar' }
  		it { should have_title('Ingresar') }
  		it { should have_selector('div.alert.alert-danger') }

  		describe "after visit page" do
  			before { click_link 'Home' }
  			it { should_not have_selector('div.alert.alert-danger') }
  		end
  	end

  	describe "with valid information" do
  	  let(:user) { FactoryGirl.create(:user) }
  	  before do
	  	  fill_in "Email"    , with: user.email
	  	  fill_in "Password" , with: user.password
	  	  click_button 'Ingresar'
  	  end

  	  it { should have_title(user.name) }
  	  it { should have_link('Profile', href: user_path(user)) }
  	  it { should have_link('Salir', href: signout_path) }
  	  it { should_not have_link('Ingresar', href: signin_path) }

  	  describe "followed by a signout" do
  	    before { click_link 'Salir'}
  	    it { should have_link 'Ingresar' }
  	  end

  	end
    
  end
end
