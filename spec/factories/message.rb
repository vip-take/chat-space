FactoryGirl.define do
  factory :message do
    comment { Faker::Lorem.sentence }

    after(:build) do |message|
      user = create(:user)
      group = create(:group, user_ids: [user.id])
      message.user_id = user.id
      message.group_id = group.id
    end
  end
end
