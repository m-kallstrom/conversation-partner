class ExtraContent


  def self.tongue_twister
    tt= ["Peter Piper picked a peck of pickled peppers.", "She sells seashells by the seashore.", "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", "I saw Susie sitting in a shoe shine shop.", "I scream, you scream, we all scream for ice cream!", "I saw a kitten eating chicken in the kitchen", "Knife and a fork, bottle and a cork, that is the way you spell New York.", "There's a sandwich on the sand which was sent by a sane witch.", "Chicken in the car and the car can go, that is the way you spell Chicago", "If two witches would watch two watches, which witch would watch which watch?", "I have got a date at a quarter to eight; I’ll see you at the gate,so don’t be late.", "Four furious friends fought for the phone"]
      tongue_twister = tt.sample
      "Here's a tongue twister to try: #{tongue_twister}"
    end


  def self.joke
    j = ["Why is the letter 'T' like an island? \n\n Because it's in the middle of 'water'.", "What starts with 'P', ends with 'E', and has millions of letters? \n\n The 'Post Office'!", "What word begins with 'e', ends with 'e', and has only one letter? \n\n 'Envelope'", "Which month has 28 days? \n\n All of them!", "If you take 3 apples from a basket that has 12 apples, how many apples do you have? \n\n 3!", "Can a kangaroo jump higher than the Empire State Building? \n\n Yes, because the Empire State Building can't jump!",  ]
    joke = j.sample
    "I have a joke for you:  #{joke}"
  end


  def self.fun_English_phrase
    ep = [ "To 'hit the books' means 'to study. For example: 'Sorry but I can’t watch the game with you tonight, I have to hit the books. I have a huge exam next week!'", "To 'hit the sack' means 'to go to bed'. For example:  'It’s time for me to hit the sack, I’m so tired.'", ]
    english_phrase = ep.sample
    "Here's something we say a lot in English: #{english_phrase}.  Try using it in your own sentence!"
  end


end
