FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'takumi0904'}
    password_confirmation {'takumi0904'}
    first_name            {'林'}
    last_name             {'拓海'}
    first_name_kana       {'ハヤシ'}
    last_name_kana        {'タクミ'}
    birthday              {'1997-09-04'}
  end
end