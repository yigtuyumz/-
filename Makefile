include Makefile.inc

CC				:=	clang
CFLAGS			:=	-Wall -Wextra -Werror -std=c99
CFLAGS_DEBUG	:=	-Wall -Wextra -g -std=c99
SRCS			:=	$(wildcard ./*.c)
RELEASE_BIN		:=	$(SRCS:.c=_release)
DEBUG_BIN		:=	$(SRCS:.c=_debug)
BACKUP_LOC		:=	$(shell realpath .)/backups
INDENT_BACKUPS	:=	$(SRCS:.c=.c.bak)

.SUFFIXES:
.SILENT:
.PHONY:		all debug clean fclean backup test indent

all: $(RELEASE_BIN)

debug: $(DEBUG_BIN)

clean:
	rm -f $(RELEASE_BIN) $(DEBUG_BIN)
	echo "$(COLOR_DONE) Cleaned executables."

fclean: clean
	rm -rf $(BACKUP_LOC)
	echo "$(COLOR_DONE) Removed backup folder."

indent:
	indent $(SRCS)
	echo "$(COLOR_DONE) Indentation done."
	rm $(INDENT_BACKUPS)


backup:
	NOW=$$(date +"%d-%m-%Y--%I-%M-%S-%2N%p");	\
	DIR="$(BACKUP_LOC)/$$NOW";					\
	mkdir -p "$$DIR";							\
	cp $(SRCS) "$$DIR"
	echo "$(COLOR_DONE) Updated source backups with $(COLOR_YELLOW)\`indent\`$(COLOR_RESET)."


%_release: %.c
	$(CC) $(CFLAGS) $< -o $@
	echo "$(COLOR_DONE) Built $(COLOR_RED)release$(COLOR_RESET) executable: $(COLOR_GREEN)$@$(COLOR_RESET)"

%_debug: %.c
	$(CC) $(CFLAGS_DEBUG) $< -o $@
	echo "$(COLOR_DONE) Built $(COLOR_BLUE)debug$(COLOR_RESET) executable: $(COLOR_YELLOW)$@$(COLOR_RESET)"