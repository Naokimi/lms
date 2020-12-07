FactoryBot.define do
  factory :user do
    email      { 'test@email.com' }
    first_name { 'First' }
    last_name  { 'Last' }
    token      { 'token123' }
  end
end
