User.create(username: "test", email: "test@test.com", password: "12345")

User.create(username: "test2", email: "testtest@test.com", password: "12345")

Question.create(title: "This is my question", question: "???", user_id: 1)

Question.create(title: "This is my second question", question: "???", user_id: 1)

Question.create(title: "This is MY question", question: "???", user_id: 2)

Answer.create(answer: "This is my answer", user_id: 1, question_id: 1)

Answer.create(answer: "This is my second answer", user_id: 2, question_id: 1)

Answer.create(answer: "THIS IS MY answer", user_id: 2, question_id: 2)

Answer.create(answer: "This is MY answer", user_id: 1, question_id: 3)

User.last.comments.create(comment: "hi", user_id: 1)

User.last.votes.create(user_id: 1)
