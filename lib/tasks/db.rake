namespace :db do
  task assign_users: :environment do
    articles = Article.where(user_id: nil)
    articles.update_all(user_id: User.last.id)
    puts 'updated articles succesfully'
  end
end
