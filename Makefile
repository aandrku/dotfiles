
link/ghostty:
	mkdir -p $(HOME)/.config/ghostty
	rm -rf $(HOME)/.config/ghostty/config
	ln -s $(CURDIR)/ubuntu/ghostty/config $(HOME)/.config/ghostty/config
