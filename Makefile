# global variables
DOTFILES_EXCLUDES   := .DS_Store .git .gitmodule
DOTFILES_TARGET     := $(wildcard .??*) bin
export DOTFILES_DIR := $(PWD)
export DOTFILES_HOME := $(HOME)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

TARGETS = asdf asdf-plugins ruby python jq bashrc
CACHES = $(TARGETS:%=cache/%)
SCRIPT_FILE = "temp-install.sh"

# 依存関係を考慮して適切な順番になるようにインストールスクリプトを構築する
.PHONY: build-install-start
build-install-start:
	@echo "DOTFILES_DIR=$(PWD)" >> $(SCRIPT_FILE)
	@echo "DOTFILES_HOME=$(HOME)" >> $(SCRIPT_FILE)

.PHONY: build-install
build-install: build-install-start $(CACHES)
	@echo "build end"

# インストールスクリプトの依存関係を定義
cache/% : etc/install/install_%.sh
	@echo ". $<" >> $(SCRIPT_FILE)

cache/asdf : cache/curl cache/git cache/bashrc
	@echo ". etc/install/install_asdf.sh" >> $(SCRIPT_FILE)

cache/ruby : cache/libssl-dev cache/zlib1g-dev
	@echo ". etc/install/install_ruby.sh" >> $(SCRIPT_FILE)

cache/python : cache/zlib1g-dev cache/libsqlite3-dev cache/libreadline-dev cache/libbz2-dev
	@echo ". etc/install/install_python.sh" >> $(SCRIPT_FILE)

cache/pipx : cache/python
	@echo ". etc/install/install_pipx.sh" >> $(SCRIPT_FILE)
