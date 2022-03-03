default: all

all: check

check: check-family check-factorial check-gcd

clean:
	@rm -f *.output
	@rm -f *.class
	@rm -f *.exe

# Rules to get outputs of the assignments.
FORCE: # no dependancies -- always dirty

# Prolog
%.output: %.pl FORCE
	swipl -q -g halt $*.pl  >$*.output 2>&1



# Make sure the output matches the expected output
check-%: %.output
	diff -yab $*.output $*.expected
	@echo $*-Success!


submit: check submit-without-check

submit-without-check:
	git add -u 
	git commit -m "Submission" || echo "** Nothing has changed"
	git push origin master 
	git log -1

update-http:
	git pull https://gitlab.csi.miamioh.edu/CSE465/instructor/lab04.git

update-ssh:
	git pull git@gitlab.csi.miamioh.edu:CSE465/instructor/lab04.git

update: update-ssh 

