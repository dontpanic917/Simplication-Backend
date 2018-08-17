# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'demo', email: 'demo', password: 'demo')
user1.bookmarks << Bookmark.create(headline: 'bingo', body: 'yeet', user_id: user1.id)
user1.subscriptions << Subscription.create(name: 'the intercept', feedUrl: 'https://theintercept.com/feed/?lang=en', user_id: user1.id)
user1.subscriptions << Subscription.create(name: 'NYT', feedUrl:'http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml', user_id: user1.id)
