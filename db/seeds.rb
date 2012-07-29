# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
questions = Question.create( [  { title: 'What is Snapclass?', parent_id: 1, user_id: "1" },
                                { title: 'How much does Snapclass cost?', parent_id: 1, user_id: "2" },
                                { title: 'When does Snapclass launch?', parent_id: 1, user_id: "3" },
                                { title: 'How many employees does Snapclass have?', parent_id: 1, user_id: "4" },
                                { title: 'Was Snapclass funded or bootstrapped?', parent_id: 1, user_id: "5" } ] )

User.delete_all
users = User.create( [ { id: "1", username: "scott" },
                        { id: "2", username: "ryan" },
                        { id: "3", username: "matt" },
                        { id: "4", username: "kevin" },
                        { id: "5", username: "sydney" } ] )

# User.delete_all
# users = User.create( [ { username: "scott" },
#                         { username: "ryan" },
#                         { username: "matt" },
#                         { username: "kevin" },
#                         { username: "sydney" } ] )
