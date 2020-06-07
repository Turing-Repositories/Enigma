# Enigma






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
