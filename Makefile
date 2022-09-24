# PLACE AT THE TOP OF YOUR MAKEFILE
#---------------------------------
# Progress bar defs
#--------------------------------
#  words = count the number of words
ifneq ($(words $(MAKECMDGOALS)),1) # if no argument was given to make...
.DEFAULT_GOAL = all # set the default goal to all
#  http://www.gnu.org/software/make/manual/make.html
#  $@ = target name
#  %: = last resort recipe
#  --no-print-directory = don't print enter/leave messages for each output grouping
#  MAKEFILE_LIST = has a list of all the parsed Makefiles that can be found *.mk, Makefile, etc
#  -n = dry run, just print the recipes
#  -r = no builtin rules, disables implicit rules
#  -R = no builtin variables, disables implicit variables
#  -f = specify the name of the Makefile
%:                   # define a last resort default rule
		@$(MAKE) $@ --no-print-directory -rRf $(firstword $(MAKEFILE_LIST)) # recursive make call, 
else
ifndef ECHO
#  execute a dry run of make, defining echo beforehand, and count all the instances of "COUNTTHIS"
T := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory \
		-nrRf $(firstword $(MAKEFILE_LIST)) \
		ECHO="COUNTTHIS" | grep -c "COUNTTHIS")
#  eval = evaluate the text and read the results as makefile commands
N := x
#  Recursively expand C for each instance of ECHO to count more x's
C = $(words $N)$(eval N := x $N)
#  Multipy the count of x's by 100, and divide by the count of "COUNTTHIS"
#  Followed by a percent sign
#  And wrap it all in square brackets
ECHO = echo -ne "$(QUIT)\r [`expr $C '*' 100 / $T`%]\t"
endif
#------------------
# end progress bar
#------------------

# COLORS

GREEN	= \033[0;32m
RED		= \033[0;31m
BLUE	= \033[0;34m
GREY	= \033[38;5;240m
WHITE	= \033[0;37m
QUIT	= \033[0m

# VARIABLES

NAME	=	inception
SRCS	=	srcs/docker-compose.yml
ENV		=	srcs/.env
DIR_MDB	=	$(HOME)/data/mysql
DIR_MDB	=	$(HOME)/data/html

# RULES

all:		$(NAME)

$(DIR_MDB):
	@mkdir -pv $(DIR_MDB)

$(DIR_WP):
	@mkdir -pv $(DIR_WP)

$(NAME):	$(DIR_MDB) $(DIR_WP)
	@$(ECHO) "$(GREEN)Creating docker containers...$(QUIT)"
	@docker-compose -f $(SRCS) --env-file $(ENV) up -d

clean:
	@$(ECHO) "$(RED)Closing the containers.$(QUIT)"
	@docker-compose -f $(SRCS) --env-file $(ENV) down

fclean:	clean
	@$(ECHO) "$(RED)Deleting containers and local folders"
	@rm -rf $(DIR_MDB) $(DIR_WP)
	@docker system prune --all
	@$(ECHO) "$(RED) '$(NAME)' containers DELETED$(QUIT)"

re:		fclean all

.PHONY	=	all clean fclean

#----- Progressbar endif at end Makefile
endif