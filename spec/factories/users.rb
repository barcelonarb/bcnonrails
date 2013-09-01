# Users
FactoryGirl.define do
  factory :user do
    nickname 'joe.doe'
    email { "#{nickname}@example.com".downcase }
    password '12345678'
  end

  factory :user2, class: User do
    nickname 'joe.foo'
    email { "#{nickname}@example.com".downcase }
    password '12345678'
  end

  factory :with_oauth, class: User do
    nickname 'joe.githuber'
    email { "#{nickname}@example.com".downcase }
  end
end

# Authentications
FactoryGirl.define do
  factory :authentication do
    association :user, factory: :user

    uid { SecureRandom.hex(4) }
    provider 'github'
  end

  factory :uniq_authentication, class: Authentication do
    association :user, factory: :user2

    uid { SecureRandom.hex(4) }
    provider 'github'
  end

  factory :github, class: Authentication do
    association :user, factory: :with_oauth, strategy: :build

    uid '12121212'
    provider 'github'
  end
end