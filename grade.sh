# String to help compile/run the tester (reused alot)
CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

# Removes previous student submission + clones new one
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
# Checks if the file named ListExamples.java exists
if [[ -f student-submission/ListExamples.java ]]  
then  
    echo "ListExamples.java found!"
    cp student-submission/ListExamples.java ./
else
    echo "ListExamples.java not found; Score = FAIL"
fi

# Sets the javac compile to a command to use in a conditional
COMPILE=`javac -cp $CPATH *.java`

# Checks the return of javac to see if it compiles (0 means works, 1 means error)
if [[ COMPILE -eq 0 ]]
then
    echo "Yeah it compiled"
    java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > scoring.txt
    
else
    echo "L bozo no compile; Score = FAIL"
    exit 1
fi