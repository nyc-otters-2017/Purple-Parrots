user_one = User.create(username: "test", email: "test1@test.com", password: "12345")

user_two = User.create(username: "test2", email: "test2@test.com", password: "12345")

user_three = User.create(username: "test3", email: "test3@test.com", password: "12345")

user_four = User.create(username: "test4", email: "test4@test.com", password: "12345")

user_five = User.create(username: "test5", email: "test5@test.com", password: "12345")

question_one = Question.create(title: "This is my question", question: "User experience iteration low hanging fruit hypotheses stock. Marketing customer iPad holy grail seed round alpha funding churn rate pitch return on investment bootstrapping rockstar. Termsheet social media investor strategy virality series A financing. Market return on investment stealth ecosystem rockstar facebook gen-z holy grail virality business-to-consumer founders network effects user experience. Branding business model canvas rockstar. Seed round launch party startup user experience pitch handshake gamification non-disclosure agreement paradigm shift validation. Android creative alpha non-disclosure agreement iPhone series A financing long tail termsheet business plan A/B testing business-to-business. User experience business model canvas stock backing learning curve agile development leverage seed round launch party hypotheses. Branding ownership leverage. Ownership startup iteration scrum project return on investment sales seed money android social media innovator direct mailing hypotheses ramen.", user_id: 1)

question_two = Question.create(title: "This is my second question", question: "IPad monetization android bandwidth gamification virality burn rate series A financing user experience return on investment research & development. Android analytics startup alpha backing disruptive client. Marketing validation long tail learning curve return on investment. Bootstrapping gamification channels pivot business model canvas advisor social media. Accelerator long tail hypotheses startup. Seed round crowdsource facebook seed money supply chain scrum project infrastructure business-to-consumer strategy responsive web design focus stock handshake. Early adopters series A financing MVP incubator user experience strategy customer crowdsource startup traction vesting period success churn rate crowdfunding. Lean startup business-to-business stealth strategy seed round deployment iPhone rockstar funding. Stock low hanging fruit buyer seed round analytics metrics buzz twitter business model canvas launch party niche market. Rockstar accelerator paradigm shift handshake monetization supply chain user experience buyer long tail success launch party conversion sales release.", user_id: 1)

question_three = Question.create(title: "This is MY question", question: "Iteration A/B testing bootstrapping twitter stock market accelerator channels entrepreneur. Low hanging fruit seed money technology startup virality early adopters gen-z accelerator leverage creative product management partner network success iPhone. Research & development gen-z validation customer partner network venture seed money beta android. Sales incubator accelerator vesting period termsheet responsive web design supply chain facebook monetization. Analytics A/B testing alpha graphical user interface low hanging fruit bootstrapping funding business-to-business seed round branding buyer. Leverage infrastructure direct mailing branding early adopters disruptive network effects freemium first mover advantage investor series A financing non-disclosure agreement. Sales startup analytics long tail iPad holy grail customer influencer iteration paradigm shift angel investor market. Marketing social proof business model canvas sales niche market partner network alpha backing. Churn rate validation launch party crowdsource direct mailing analytics deployment freemium termsheet channels hypotheses. Scrum project branding conversion early adopters success innovator beta graphical user interface crowdfunding.", user_id: 2)

Answer.create(answer: "This is my answer", user_id: 1, question_id: 1)

Answer.create(answer: "This is my second answer", user_id: 2, question_id: 1)

Answer.create(answer: "THIS IS MY answer", user_id: 2, question_id: 2)

Answer.create(answer: "This is MY answer", user_id: 1, question_id: 3)

User.last.comments.create(comment: "hi", user_id: 1)

question_one.votes.create(votable_id: "1", votable_type: question_one, user_id: 1)
question_one.votes.create(votable_id: "1", votable_type: question_one, user_id: 2)
question_one.votes.create(votable_id: "1", votable_type: question_one, user_id: 3)
question_one.votes.create(votable_id: "1", votable_type: question_one, user_id: 4)
question_one.votes.create(votable_id: "1", votable_type: question_one, user_id: 5)

question_two.votes.create(votable_id: "2", votable_type: question_two, user_id: 2)
question_two.votes.create(votable_id: "2", votable_type: question_two, user_id: 3)

question_three.votes.create(votable_id: "3", votable_type: question_three, user_id: 2)
question_three.votes.create(votable_id: "3", votable_type: question_three, user_id: 3)
question_three.votes.create(votable_id: "3", votable_type: question_three, user_id: 5)
