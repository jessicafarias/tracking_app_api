FactoryBot.define do
  factory :user do
    email { 'user@apiguard.com' }
    name { 'name1' }
    password { 'api_pass' }
    password_confirmation { 'api_pass' }
  end

  factory :user_1, class: User do
    email { 'user_1@apiguard.com' }
    name { 'name2' }
    password { 'api_pass' }
    password_confirmation { 'api_pass' }
  end

  factory :task do
    name { 'Image' }
    expiration_day { Date.today + 1 }
    img { 'http://res.cloudinary.com/ddcakt97r/image/upload/v1599940689/event_center/meta-studio-35-PJXAjKduyjQ-unsplash_onzzzc.jpg' }
  end

  factory :track do
    time { 1 }
    goal { 2 }
    progress { 50 }
    day { Date.today }
  end
end
