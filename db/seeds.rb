user_one = User.create(username: "testtest", email: "abc@123", password: "PASSword99!")

user_three = User.create(email: "dbc3@dbc.com", password: "PASSword99!")

user_two = User.create(username: "Silver Snake", email: "test2@dbc.com", password: "PASSword99!")

user_four = User.create(username: "Red Jaguar", email: "dbc4@dbc.com", password: "PASSword99!")

user_five = User.create(username: "Green Monkey", email: "dbc5@dbc.com", password: "PASSword99!")

question_one = Question.create(title: "This is my question", question: "User experience iteration low hanging fruit hypotheses stock. Marketing customer iPad holy grail seed round alpha funding churn rate pitch return on investment bootstrapping rockstar. Termsheet social media investor strategy virality series A financing. Market return on investment stealth ecosystem rockstar facebook gen-z holy grail virality business-to-consumer founders network effects user experience. Branding business model canvas rockstar. Seed round launch party startup user experience pitch handshake gamification non-disclosure agreement paradigm shift validation. Android creative alpha non-disclosure agreement iPhone series A financing long tail termsheet business plan A/B testing business-to-business. User experience business model canvas stock backing learning curve agile development leverage seed round launch party hypotheses. Branding ownership leverage. Ownership startup iteration scrum project return on investment sales seed money android social media innovator direct mailing hypotheses ramen.", user_id: 1)

question_two = Question.create(title: "This is my second question", question: "IPad monetization android bandwidth gamification virality burn rate series A financing user experience return on investment research & development. Android analytics startup alpha backing disruptive client. Marketing validation long tail learning curve return on investment. Bootstrapping gamification channels pivot business model canvas advisor social media. Accelerator long tail hypotheses startup. Seed round crowdsource facebook seed money supply chain scrum project infrastructure business-to-consumer strategy responsive web design focus stock handshake. Early adopters series A financing MVP incubator user experience strategy customer crowdsource startup traction vesting period success churn rate crowdfunding. Lean startup business-to-business stealth strategy seed round deployment iPhone rockstar funding. Stock low hanging fruit buyer seed round analytics metrics buzz twitter business model canvas launch party niche market. Rockstar accelerator paradigm shift handshake monetization supply chain user experience buyer long tail success launch party conversion sales release.", user_id: 1)

question_three = Question.create(title: "This is MY question", question: "Iteration A/B testing bootstrapping twitter stock market accelerator channels entrepreneur. Low hanging fruit seed money technology startup virality early adopters gen-z accelerator leverage creative product management partner network success iPhone. Research & development gen-z validation customer partner network venture seed money beta android. Sales incubator accelerator vesting period termsheet responsive web design supply chain facebook monetization. Analytics A/B testing alpha graphical user interface low hanging fruit bootstrapping funding business-to-business seed round branding buyer. Leverage infrastructure direct mailing branding early adopters disruptive network effects freemium first mover advantage investor series A financing non-disclosure agreement. Sales startup analytics long tail iPad holy grail customer influencer iteration paradigm shift angel investor market. Marketing social proof business model canvas sales niche market partner network alpha backing. Churn rate validation launch party crowdsource direct mailing analytics deployment freemium termsheet channels hypotheses. Scrum project branding conversion early adopters success innovator beta graphical user interface crowdfunding.", user_id: 2)

question_four = Question.create(title: "This is the last question", question: "Infographic buzz beta early adopters conversion return on investment user experience prototype backing market. Seed money deployment vesting period funding handshake partner network advisor bootstrapping. Innovator marketing success android conversion vesting period holy grail. Low hanging fruit market advisor research & development growth hacking supply chain early adopters social media seed round paradigm shift. Twitter social media growth hacking iPhone stock investor value proposition non-disclosure agreement. Prototype value proposition graphical user interface social proof paradigm shift influencer success launch party non-disclosure agreement facebook vesting period pitch. Validation interaction design market angel investor early adopters partnership funding success partner network equity focus release ownership. Long tail focus iPad. Business plan disruptive iPhone founders research & development user experience market buzz paradigm shift. Startup conversion sales virality early adopters ownership.", user_id: 5)

answer_one = Answer.create(answer: "This is my answer", user_id: 1, question_id: 1)

answer_two = Answer.create(answer: "This is my second answer", user_id: 2, question_id: 2)

answer_three = Answer.create(answer: "THIS IS MY answer", user_id: 2, question_id: 3)

answer_four = Answer.create(answer: "This is MY answer", user_id: 1, question_id: 4)

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


question_one.comments.create(comment: "Great question", commentable_id: "1", commentable_type: question_one, user_id: 1)
question_two.comments.create(comment: "Please Explain More", commentable_id: "2", commentable_type: question_two, user_id: 2)
question_three.comments.create(comment: "Have you tried restarting your computer", commentable_id: "3", commentable_type: question_three, user_id: 3)
question_four.comments.create(comment: "Have you googled it", commentable_id: "4", commentable_type: question_four, user_id: 4)
answer_one.comments.create(comment: "Thanks that was super helpful!", commentable_id: "1", commentable_type: answer_one, user_id: 1)
answer_two.comments.create(comment: "I don't have that version", commentable_id: "2", commentable_type: answer_two, user_id: 2)
answer_three.comments.create(comment: "Wow I hadn't thought of it that way, mind blown!", commentable_id: "3", commentable_type: answer_three, user_id: 2)
answer_four.comments.create(comment: "Smart! You really know your stuff!", commentable_id: "4", commentable_type: answer_four, user_id: 5)
