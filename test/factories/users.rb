# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

  	first_name "John"
  	last_name "Galt"
  	sequence(:email) {|n| "john#{n}@galt.com"}
  	password "whoisjohngalt"

  end
end

FactoryGirl.define do

	factory :project do
		user

		title "Rearden Metal"
		teaser "It is lighter than traditional steel but stronger, and is to steel what steel was to iron."
		description "it is described as greensh-blue. Among its its ingredients are iron and copper"
		goal 1000000

		end
	end
