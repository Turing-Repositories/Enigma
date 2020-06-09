# Enigma

My evaluation:
Functionality - Below Expectations: I was still unable to get the decrypt cli working properly.

Object Oriented Programming - Meets Expectations: There are definitely many things I still need to work on. However, I felt that my classes were broken down well enough to follow the SRP, with the exception of my module which I would have loved to refactor. My classes are all near the same size, not too long or too short.

Ruby Conventions and Mechanics - Meets Expectations: I implemented multiple hashes and was able to keep my code uniform for the most part. Many of the enumerables used were thought out and chosen specifically for the task at hand.

TDD - Meets Expectations: I made sure to test everything I could so that I could see that sweet 100% coverage when raking. I could always use improvement on committing more often, but felt as this project was a clear improvement over previous ones.  

Version Control - Somewhere in the middle of Meets Expectations and Below. I had a few git fires that really through off my version control flow. I was trying really hard to make sure my commits were not multiple chunks of functionality, however after using a git rest soft head, expecting it to just undo my last commit when I accidentally hit tab complete and it committed a bunch of changes at once, it messed everything up. I learned a very important lesson. Just because you can commit in chunks of functionality doesn't mean you should. It is much better coding etiquette to just commit when you add something you know you will need. It is okay if you change it or remove it completely, what is important is that you add that snapshot of your code even if it is not working. You can always change things, and this is one of the biggest lessons this project taught me.  


#### Thoughts

##### **Initial Questions**
- Does the key stay the same?
- What classes do I think I will need?

1. Enigma: Encrypt and decrypt methods
2. Encrypt: Encrypt methods
3. Decrypt: Decrypt methods
4. Key: Create keys
5. Offset: Create offsets  
6. Shift: All the shifting methods?
7. Command Line Interface:
8. Cracking: If we make it this far


#### **Blueprint**

##### **6/5/2020**
- So far the Enigma class is in the 'set up' phase.
- Need to create both the key and offset classes before continuing.
- Worked on the Keys class. Realized I named the branch 'keys' instead of 'key'.
- Was able to find key_numbers that I passed in directly.
- Researched generating random numbers.

##### **6/6/2020**
- Set up test for generating random numbers.
- Researched mocks and stubs for the above test. Will come back to this.
- After watching a tutorial, was able to generate key set numbers.
- Ran into a problem where my random_key_numbers were not stubbing properly.
- ```
 +# encoding: US-ASCII ```
 The stubs and returns are not working.
- Researched mini test and US-ASCII
- Still stuck on this bug hours later.
- Found something interesting in API docs. .rjust(arg)
- [Link to .rjust on api dock](https://apidock.com/ruby/v1_8_7_72/String/rjust)
- IT WORKS! :tada:. By removing a number from my Key.new argument, I am able to allow the test to pass.
- .rjust can be used to pass arguments that allow you to add a character if it is under a certain length.
- This allows minitest to not populate it with a random number but a predictive number which allows the test to pass.
- The above actually does not matter if you remove the extra letters in our stubs. If you use ``` key.stubs(:random_number).returns('43520')```  you will encounter the above error and will need to use the above fix to get by. However, if you use key.stubs(:rand).returns('43520'), you will avoid the error all together.
- Created offset class and passed all tests

**Next Steps**
- Encrypt: Add keys and offsets together. Shift characters
- Decrypt: .reverse of encrypt?
- Shift: Should this even be a class?
- Enigma:
- Command Line Interface:
- Cracking:

- Worked on encryption class. Was hard stuck on shift alphabet letter

##### **6/7/2020**
- Worked on getting shift alphabet to work. Started out being nested, but after looking into guard clauses wanted to try it out.
- I see that the test is passing after loads of trial and error.
- Was able to encrpyt message and pass tests
- Finished up Encryption class

- Create decryption class and see if we can decrypt the message.
- Decrypt class is done and was able to decrpyt my message.
- What will we need to add so that the keys are automatically passed instead of manually adding in the minus signs for decrypt?

- Thinking that the shift and alphabet methods could be put in a module at some point.

- Created a reuseables module.
- Refactored all classes accordingly.
- Working on getting enigma class finished.
- Fix bug with date not populating correctly.
- Work on bug to get message working.

##### **6/8/2020**
- Fixed bugs that were preventing me from passing the enigma tests.
- Started CLI implementation.
- Quickly ran into an error
- ```No such file or directory @ rb_sysopen - message.txt (Errno::ENOENT)```
- After hours of searching was able to find a work around.
- Was able to get encrpyt.rb cli to run successfully
- Work on decrpyt.rb cli
- Unable to get it to work properly. Thinking my key is being populated with a different number than I want.

##### **6/9/2020**
- Changed all the file names for the encrypt and decrypt classes so that they didnt not clash with the new cli implementation.
- Had to revisit the path bug and fix it again.
- Deleted all the unneeded code and code that was commented out.
- Deleted the duplicate files and folders.
- Work on decrpyt.rb cli as it is still not working successfully.
- Checked coverage, 100% still.
- Merged all for evaluation.
