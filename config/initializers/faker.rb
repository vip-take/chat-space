# emailが正しく生成されないため、データはデフォルトでenで生成されるように
Faker::Config.locale = :en if Rails.env.development? || Rails.env.test?
