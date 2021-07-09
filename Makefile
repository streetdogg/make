PROJECT=main

# find path to all *.c files in the directory
SRC=$(shell find -iname "*.c")

# replace all the *.c with *.o
OBJS=$(patsubst %.c,%.o,$(SRC))

# Find all directories that have the *.h file
INC=$(shell find . -name "*.h" -printf '%h/')

# Depends on all *.o files
$(PROJECT): $(OBJS)
	gcc -o $@ $^

# for every file foo.o depends on foo.c [replace .o with .c]
%.o: %.c
	gcc -I$(INC) -c $^ -o $@

# the targets listed don't have dependency!
.PHONY: clean

# remove the object files and the project
clean:
	rm -rf $(OBJS) $(PROJECT)