FactoryGirl.define do
  factory :user do
    email "abc@abc.com"
    password "foobar12"
    password_confirmation {|u| u.password}
  end
end
