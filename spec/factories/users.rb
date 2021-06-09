FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              { '1a' +Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    nickname              {Faker::Name.initials}
		last_name             {'名字'}
		first_name            {'名前'}
		last_name_reading     {'ミョウジ'}
		first_name_reading    {'ナマエ'}
		birthday              {'1930-01-01'}
  end
end