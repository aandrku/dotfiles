
link/ghostty:
	mkdir -p $(HOME)/.config/ghostty
	rm -rf $(HOME)/.config/ghostty/config
	ln -s $(CURDIR)/ghostty/config $(HOME)/.config/ghostty/config


link/nvim:
	mkdir -p $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/nvim
	ln -s $(CURDIR)/nvim $(HOME)/.config/nvim
