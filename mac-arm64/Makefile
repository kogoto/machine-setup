.PHONY: install-homebrew install-softwares install-appstore-apps dotfiles setup
setup: install-homebrew install-softwares dotfiles

GREEN  := \033[32m
YELLOW := \033[33m
BLUE   := \033[34m
RESET  := \033[0m

install-homebrew:
	@echo "$(BLUE)Installing Homebrew...$(RESET)"
	@/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@grep -qxF 'eval "$$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile || echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	@source ~/.zprofile
	@echo "$(GREEN)Homebrew installation completed!$(RESET)"

install-softwares:
	@echo "$(BLUE)Installing Rosetta 2...$(RESET)"
	@softwareupdate --install-rosetta --agree-to-license
	@echo "$(GREEN)Rosetta 2 installation completed!$(RESET)"
	@echo "$(BLUE)Installing Homebrew formulas...$(RESET)"

	@BREW_FORMULAS="\
		direnv \
		neovim \
		gh \
		git \
		go-task \
		mise \
		jq \
		ripgrep \
		sheldon \
		tree \
		"; \
	for formula in $${BREW_FORMULAS}; do \
		echo "$(YELLOW)Installing $${formula}...$(RESET)"; \
		brew install $${formula}; \
	done
	@echo "$(GREEN)Homebrew formulas installation completed!$(RESET)"
	@echo "$(BLUE)Installing Homebrew cask formulas...$(RESET)"

	@BREW_CASK_FORMULAS="\
		docker \
		google-chrome \
		google-japanese-ime \
		iterm2 \
		visual-studio-code \
		chatgpt \
		zoom \
		"; \
	for formula in $${BREW_CASK_FORMULAS}; do \
		echo "$(YELLOW)Installing $${formula}...$(RESET)"; \
		brew install --cask $${formula}; \
	done
	@echo "$(GREEN)Homebrew cask formulas installation completed!$(RESET)"

	@defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
	@defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

install-appstore-apps:
	@brew install mas

	@echo "$(BLUE)Installing AppStore apps...$(RESET)"
	@APP_IDS="\
		539883307 \
		"; \
	for app_id in $${APP_IDS}; do \
		echo "$(YELLOW)Installing $${app_id}...$(RESET)"; \
		mas install $${app_id}; \
	done
	@echo "$(GREEN)AppStore apps installation completed!$(RESET)"

dotfiles:
	@echo "$(BLUE)Creating symbolic links to dotfiles...$(RESET)"
	@DOTFILES="\
		.zshrc \
		.zsh \
		.gitconfig \
		.p10k.zsh \
		.config/nvim \
		.config/sheldon \
		"; \
	for file in $${DOTFILES}; do \
		source_file="$$(pwd)/dotfiles/$${file}"; \
		target_file="$${HOME}/$${file}"; \
		rm -rf $${target_file}; \
		ln -sv $${source_file} $${target_file}; \
	done
	@echo "$(GREEN)Dotfiles setup completed!$(RESET)"
