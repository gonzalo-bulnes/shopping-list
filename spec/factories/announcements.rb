FactoryGirl.define do
  factory :announcement do
    message "Welcome!"
    starts_at 1.hour.ago
    ends_at 1.hour.from_now
  end
end
