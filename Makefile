CC = gcc
CC_OPTS= -std=gnu11 -Wall -O0 -g
SRCDIR=src
LIBNAME=libcexampleplugin
src=$(addprefix $(SRCDIR)/, *.c)


$(LIBNAME).so: $(LIBNAME).o
	$(CC) $(LIBNAME).o -shared  -o $(LIBNAME).so

$(LIBNAME).o: $(src)
	$(CC) -c -fPIC $(CC_OPTS) $(src) -o $(LIBNAME).o

#man install
.PHONY: copy
copy: $(LIBNAME).so
	rm -f /tmp/$(LIBNAME).so
	cp -f $(LIBNAME).so /tmp/

.PHONY: clean
clean:
	rm -f $(LIBNAME).so
	rm -f $(LIBNAME).o