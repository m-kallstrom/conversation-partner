class ExtraContent


  def self.tongue_twister
    tt= ["Peter Piper picked a peck of pickled peppers.",
      "She sells seashells by the seashore.",
      "How much wood would a woodchuck chuck if a woodchuck could chuck wood?",
      "I saw Susie sitting in a shoe shine shop.",
      "I scream, you scream, we all scream for ice cream!",
      "I saw a kitten eating chicken in the kitchen",
      "Knife and a fork, bottle and a cork, that is the way you spell New York.",
      "There's a sandwich on the sand which was sent by a sane witch.",
      "Chicken in the car and the car can go, that is the way you spell Chicago",
      "If two witches would watch two watches, which witch would watch which watch?",
      "I have got a date at a quarter to eight; I’ll see you at the gate,so don’t be late.",
      "Four furious friends fought for the phone"]

      tongue_twister = tt.sample
      "Here's a tongue twister to try: #{tongue_twister}"
    end


  def self.joke
    j = ["Why is the letter 'T' like an island? \n\n Because it's in the middle of 'water'.",
      "What starts with 'P', ends with 'E', and has millions of letters? \n\n The 'Post Office'!",
      "What word begins with 'e', ends with 'e', and has only one letter? \n\n 'Envelope'",
      "Which month has 28 days? \n\n All of them!",
      "If you take 3 apples from a basket that has 12 apples, how many apples do you have? \n\n 3!",
      "Can a kangaroo jump higher than the Empire State Building? \n\n Yes, because the Empire State Building can't jump!",
      "Where can you find an ocean without water? \n\n On a map!",
      "What do you call a fish without an eye? \n\n A fsh." ]
    joke = j.sample
    "I have a joke for you:  #{joke}"
  end


  def self.english_phrase
    ep = [ "To 'hit the books' means 'to study. For example: 'Sorry but I can’t watch the game with you tonight, I have to hit the books. I have a huge exam next week!'",
      "To 'hit the sack' means 'to go to bed'. For example:  'It’s time for me to hit the sack, I’m so tired.'",
      "To 'sit tight' means 'to wait patiently'. For example:  'Sit tight and the doctor will see you soon.'",
      "To '(be) up in the air' means that something is uncertain and there are no definite plans. For example: 'My plans for dinner are up in the air right now because I don't know who will come and where we will eat.'",
      "To 'pitch in' means 'for everyone to help or join in'. For example:  'Cleaning the house is a lot of work. I need everyone to pitch in so we can finish faster.'",
      "To 'ring a bell' means 'to sound familiar' and you use it when you think you've heard something before but can't remember it exactly. For example: 'Do you know Adam?' 'The name rings a bell, but I can't remember who you mean.'",
      "To 'be under the weather' means 'to feel sick'. For example: 'Are you okay? You look under the weather today.'",
      "To 'call it a day' means 'to decide to finish working.' For example: 'Let's call it a day. I'm feeling really tired.'",
      "To 'make up [my/your/his/her] mind' means 'to decide.' For example:  'Both of these cookies look really good. I can't make up my mind!'",
      "To 'keep [my/your/her/his] fingers crossed' means 'to wish for good luck.' For example: 'The grades for the test will be posted tomorrow. I'm keeping my fingers crossed that I passed.",
      "To 'play it by ear' means 'to do something without a plan and to make decisions without a plan.' For example:  'I didn't plan the camping trip, so let's meet at the park and then we'll play it by ear.'",
      "'I can't wait' means that you are really excited for something and looking forward to it. For example:  'I can't wait to see my favorite band next week!'"]
    english_phrase = ep.sample
    "Here's something we say a lot in English: '#{english_phrase}.'  Try to use it in your own sentence!"
  end


end
