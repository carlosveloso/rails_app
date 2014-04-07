FactoryGirl.define do
	factory :user do
		   name                  "Carlos Veloso"
		   email                 "carlos@hoblee.com"
		   password              "foobar"
		   password_confirmation "foobar"
	end
end