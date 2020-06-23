# Password Checker
#
# Goal: A program that takes in a string as input and evaluates it as a valid
# password. The password is valid if it has at a minimum of one  capital letter,
# two numerical values, and one  special character and has a length of at least seven
# characters. If the password passes the check, output 'Strong Password',
# otherwise output the reason it is not a valid password .

# List of different groups to use for password
caps = "A".."Z"
chars = "a".."z"
nums = "0".."9"
symbols = ["!","@","#","$","%","^","&","*","_","=","+","-","/","€",".","?","<",">",")",";",","]

passwordMin = 6
passwordMax = 10

# Prompt a user to choose a password
puts "Please Enter Your Password"
pswd = gets.chomp


# Function to evaluate number of characters from each group
def pswdChecker(letterGroup, pswd)
  sum = 0
  freq = {}
  freq.default = 0
  pswd.each_char { |char| freq[char]+=1 }
  for i in letterGroup
    sum += freq[i]
  end
  return sum
end

# Hash function to link different letters group to their frequency
hash ={caps:pswdChecker(caps, pswd), chars:pswdChecker(chars, pswd), nums:pswdChecker(nums, pswd), symbols:pswdChecker(symbols, pswd)}
# puts hash

# Condition statements to check integrity of password
if (pswd.size > passwordMin)
  if hash[:caps] < 1
    puts "Please Use a capital letter in your password \n "
  end
  if  hash[:nums] < 2
    puts "Please Use at least two numbers in your password \n "
  end
  if hash [:symbols] < 1
    puts "Please Use a symbol in your password \n "
  end
  if (hash[:caps] > 0) && (hash[:nums] > 1) && (hash[:symbols] > 0)
    puts " STRONG PASSWORD \n"
  end
else
  puts " INVALID PASSWORD : Your paswword must contain all of the following: \n
         \t * \t At least seven(7) characters \n
         \t * \t At least one(1) capital letter \n
         \t * \t At least two(2) numbers \n
         \t * \t At least one(1) symbol \n
          PLEASE TRY AGAIN."
end
