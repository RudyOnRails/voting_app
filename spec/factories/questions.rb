require 'faker'

FactoryGirl.define do
  factory :question do |f|
    f.title { Faker::Lorem.words }
  end
end