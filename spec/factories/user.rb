FactoryGirl.define do
  
  factory :user do
    nickname  "eric-dowty"
    image_url "https://avatars.githubusercontent.com/u/10349516?v..."
    provider  "github"
  end

  # Want to call your factory "admin" but use the `User` class? Use an alias like this.
  # factory :admin, class: User do  
  #   first_name "sally"
  #   last_name  "genericlastname"
  #   username   "sg"
  #   admin      true
  # end

end