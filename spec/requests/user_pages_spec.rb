require 'spec_helper'

describe "User pages" do

	subject { page }
	describe "Signup page" do
		before { visit signup_path }
		it { should have_title('Registro') }
		it { should have_selector('h1', text: 'Registrate') }
	end

	describe "Profile page" do
		let(:user) { FactoryGirl.create(:user) } 

		before { visit user_path(user) }
		it { should have_title(user.name) }
		it { should have_selector('h1', text: user.name) }
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Crear cuenta" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Carlos Veloso"
				fill_in "Email", with: "cveloso.cl@gmail.com"
				fill_in "Password", with: "foobar"
				fill_in "Password confirmation", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving user" do
				before { click_button submit }
				let(:user) { User.find_by(email: "cveloso.cl@gmail.com") }
				it { should have_title(user.name) }
			end
		end
		
	end
end
