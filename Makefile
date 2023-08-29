CC=gcc
CFLAGS=-std=c11 -Wall -Wpedantic

EXEC=riddler
OBJS=riddler.o
LIBPATH=lib
OBJPATH=obj

LIBHDRS=$(wildcard $(LIBPATH)/*.h)
LIBOBJS=$(patsubst $(LIBPATH)/%.h, $(OBJPATH)/%.o, $(LIBHDRS))

MKDIRCMD=mkdir -p
RMCMD=rm -rf


all: prepall $(EXEC)


$(EXEC): $(OBJS) $(LIBOBJS)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(OBJPATH)/%.o: $(LIBPATH)/%.c $(LIBPATH)/%.h
	$(CC) -c $(CFLAGS) $< -o $@


prepall:
	@[ -d $(OBJPATH) ] || $(MKDIRCMD) $(OBJPATH)

clean:
	$(RMCMD) $(OBJPATH)
	$(RMCMD) $(OBJS)


.PHONY: all clean prepall