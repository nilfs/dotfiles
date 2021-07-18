# global variables
DOTFILES_EXCLUDES   := .DS_Store .git .gitmodule
DOTFILES_TARGET     := $(wildcard .??*) bin
export DOTFILES_DIR := $(PWD)
export DOTFILES_HOME := $(HOME)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

TARGETS = asdf asdf-plugins bashrc
CACHES = $(TARGETS:%=cache/%)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)

install: $(CACHES)
	@echo "install end"

cache/% : etc/install/install_%.sh
	@sh $<

cache/asdf : cache/curl cache/git cache/bashrc
	@sh etc/install/install_asdf.sh
