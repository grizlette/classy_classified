namespace :db do

  desc "clear out DB"
  task populate: :environment do
    require 'populator'
    require 'faker'
    User.destroy_all
  end

  desc "create a bunch of users"
  task populate: :environment do
    require 'populator'
    require 'faker'
    User.populate 100 do |user|
      # binding.pry
      # Faker::Name.methods
      user.username = Faker::Name.username
      user.email = Faker::Internet.email
      user.first_name = Faker::Name.first_name
    # user.bio = Faker::Lorem.sentence(word_count = 20, 
                                      #supplemental = false, 
                                      #random_words_to_add = 10)
      puts user.username

      Category.populate 10 do |category|
      end

    end
  end

end
