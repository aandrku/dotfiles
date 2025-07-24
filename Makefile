
link/ghostty:
	mkdir -p $(HOME)/.config/ghostty
	rm -rf $(HOME)/.config/ghostty/config
	ln -s $(CURDIR)/ghostty/config $(HOME)/.config/ghostty/config
