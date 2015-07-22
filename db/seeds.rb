# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


t = Topic.create(prompt: "BuzzFeed's Top Hungry Academy Grads")

t.topic_answers.create(body: "Horace", order: 1)
t.topic_answers.create(body: "Andy", order: 2)
t.topic_answers.create(body: "Ed", order: 3)
t.topic_answers.create(body: "Verdi", order: 4)

t = Topic.create(prompt: "Andys Favorite Foods")

t.topic_answers.create(body: "Sushi", order: 1)
t.topic_answers.create(body: "Pizza", order: 2)
t.topic_answers.create(body: "Calzones", order: 3)
t.topic_answers.create(body: "Eggs", order: 4)


t = Topic.create(prompt: "Horaces Favorite Foods")

t.topic_answers.create(body: "Pesto", order: 1)
t.topic_answers.create(body: "Sushi", order: 2)
t.topic_answers.create(body: "Indian", order: 3)
t.topic_answers.create(body: "Coffee", order: 4)


SuggestedPrompt.create(body: "Your favorite foods")
SuggestedPrompt.create(body: "Your favorite breed of Toy Dog")

r = Room.create
r.create_round_from_topic(t).activate!
