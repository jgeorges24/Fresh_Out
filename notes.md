Hey Jean,

Thank you for showing me your project today! Unfortunately, there is still more work to do before the next review.

MISSING REQUIREMENTS:
1) Users should not be able to edit/update/destroy each other's resources. Make sure also the controller's actions (edit, update, destroy) have some sort of logic preventing users from accessing resources they do not own. 
FIXED

2) The nested routes for opinions exist but have never been utilized. You placed the list of opinions inside the tape show page, and so is the form for a new opinion. That means you do not use the nested routes you actually built. Those routes should have some flow control (if/else) to make sure you did actually have a tape_id AND found a tape with that id. If so, do something with that tape and its opinions. We have one more scenario to analyze: 
A) What if we come from a nested route but could not find any tape with the id specified?

3) You defined through associations for User and Tapes, but nowhere in your app you leveraged those associations. Where you think is the most appropriate (maybe in the user's show page?), make sure you leverage @user.tapes and do something with it. The vice versa also has to be implemented, anywhere you'd like (maybe in the tape's show page?) make sure you leverage @tape.users and do something with it.

Good things to keep in mind are also:

1) The README could be implemented further to make sure it has headers and paragraphs that cover anything a README should display (Description, Installation Guide, COntributing, License, etc)

2) Every form should display the related errors and you could add a few extra nice validations.

Please, make sure you leverage the resources I shared with you to prepare for the next review. Play a lot with the associations in your console until you're comfortable leveraging all of the methods each association provides you with. 👍🏻

Let me know if you have any questions! 

Best,

Matteo Piccini






    #new methods from review
    def opinion_count

        Opinion.group(:tape_id).count
        Opinion.group(:tape_id).count.max_by{|k, v| v }
        Opinion.group(:tape_id).count.max

    end


    
    must be able to get tpo this url

    http://localhost:3000/tapes/27/opinions
