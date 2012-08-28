require 'faker'

FactoryGirl.define do

  factory :question do |f|
    f.title { Faker::Lorem.words }
  end

  factory :question_invalid, parent: :question do |f|
    f.title nil
  end

end