
link/tmux:
	rm -rf $(HOME)/.tmux.conf
	ln -s $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
	
link/ghostty:
	mkdir -p $(HOME)/.config/ghostty
	rm -rf $(HOME)/.config/ghostty/config
	ln -s $(CURDIR)/ghostty/config $(HOME)/.config/ghostty/config

link/sway:
	mkdir -p $(HOME)/.config/sway
	rm -rf $(HOME)/.config/sway/config
	ln -s $(CURDIR)/sway/config $(HOME)/.config/sway/config


link/nvim:
	mkdir -p $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/nvim
	ln -s $(CURDIR)/nvim $(HOME)/.config/nvim
