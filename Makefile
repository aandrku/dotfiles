
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

link/i3:
	mkdir -p $(HOME)/.config/i3
	rm -rf $(HOME)/.config/i3
	ln -s $(CURDIR)/i3 $(HOME)/.config/i3

link/picom:
	mkdir -p $(HOME)/.config/picom
	rm -rf $(HOME)/.config/picom
	ln -s $(CURDIR)/picom $(HOME)/.config/picom
	
link/polybar:
	mkdir -p $(HOME)/.config/polybar
	rm -rf $(HOME)/.config/polybar
	ln -s $(CURDIR)/polybar $(HOME)/.config/polybar
	
link/waybar:
	mkdir -p $(HOME)/.config/waybar
	rm -rf $(HOME)/.config/waybar
	ln -s $(CURDIR)/waybar $(HOME)/.config/waybar
