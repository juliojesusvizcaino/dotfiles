{ config, pkgs, ... }:

let

  pkgsGL = import <nixgl> { };

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "julio";
  home.homeDirectory = "/home/julio";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.htop
    pkgs.fish
    pkgs.fd
    pkgs.ripgrep
    pkgs.lazygit
    pkgs.delta
    pkgs.kitty
    pkgsGL.auto.nixGLDefault
    pkgs.nil
    pkgs.nixfmt-rfc-style
    pkgs.neovim
    pkgs.basedpyright
    pkgs.fzf
    pkgs.zoxide
    pkgs.starship
    pkgs.python313
    pkgs.uv

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override {
      fonts = [
        "Hasklig"
        "Monaspace"
      ];
    })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/regolith3/Xresources".source = regolith/Xresources;
    ".config/regolith3/default_terminal" = {
      text = ''
        #!/usr/bin/sh
        nixGL kitty
      '';
      executable = true;
    };

    ".local/share/applications/kitty.desktop".source = kitty/kitty.desktop;
    ".local/share/applications/kitty-open.desktop".source = kitty/kitty-open.desktop;
    ".local/share/icons/hicolor/256x256/apps/kitty.png".source = kitty/kitty.png;
    ".config/kitty/neighboring_window.py".source = kitty/neighboring_window.py;
    ".config/kitty/pass_keys.py".source = kitty/pass_keys.py;
    ".config/kitty/zoom_toggle.py".source = kitty/zoom_toggle.py;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/julio/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    lg = "lazygit";
    v = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Julio";
    userEmail = "juliojesusvizcaino@gmail.com";
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Hasklug Nerd Font";
    };
    settings = {
      enabled_layouts = "Grid, Horizontal, Splits, Stack, Tall, Vertical, Fat";
      background_opacity = 0.95;
      allow_remote_control = "yes";
      listen_on = "unix:@mykitty";
    };
    shellIntegration.enableFishIntegration = true;
    themeFile = "Catppuccin-Frappe";
    keybindings = {
      "alt+enter" = "launch --cwd=current";

      "alt+j" = "kitten pass_keys.py neighboring_window bottom alt+j";
      "alt+k" = "kitten pass_keys.py neighboring_window top    alt+k";
      "alt+h" = "kitten pass_keys.py neighboring_window left   alt+h";
      "alt+l" = "kitten pass_keys.py neighboring_window right  alt+l";

      "alt+shift+h" = "move_window left";
      "alt+shift+j" = "move_window bottom";
      "alt+shift+k" = "move_window top";
      "alt+shift+l" = "move_window right";

      "alt+f" = "kitten zoom_toggle.py";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    # Catppuccin-Frappe: https://github.com/catppuccin/fzf
    colors = {
      "bg+" = "#414559";
      bg = "#303446";
      spinner = "#f2d5cf";
      hl = "#e78284";
      fg = "#c6d0f5";
      header = "#e78284";
      info = "#ca9ee6";
      pointer = "#f2d5cf";
      marker = "#babbf1";
      "fg+" = "#c6d0f5";
      prompt = "#ca9ee6";
      "hl+" = "#e78284";
      "selected-bg" = "#51576d";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
      # Colorscheme: Catppuccin Frappé
      set -U fish_color_normal c6d0f5
      set -U fish_color_command 8caaee
      set -U fish_color_quote a6d189
      set -U fish_color_redirection f4b8e4
      set -U fish_color_end ef9f76
      set -U fish_color_error e78284
      set -U fish_color_param eebebe
      set -U fish_color_comment 838ba7
      set -U fish_color_selection --background=414559
      set -U fish_color_search_match --background=414559
      set -U fish_color_operator f4b8e4
      set -U fish_color_escape ea999c
      set -U fish_color_cwd e5c890
      set -U fish_color_autosuggestion 737994
      set -U fish_color_user 81c8be
      set -U fish_color_host 8caaee
      set -U fish_color_cancel e78284
      set -U fish_pager_color_prefix f4b8e4
      set -U fish_pager_color_progress 737994
      set -U fish_pager_color_completion c6d0f5
      set -U fish_pager_color_description 737994
      set -U fish_pager_color_selected_description 
      set -U fish_pager_color_selected_completion 
      set -U fish_color_keyword 
      set -U fish_pager_color_selected_background 
      set -U fish_pager_color_secondary_prefix 
      set -U fish_pager_color_background 
      set -U fish_pager_color_secondary_background 
      set -U fish_pager_color_selected_prefix 
      set -U fish_pager_color_secondary_description 
      set -U fish_color_host_remote 
      set -U fish_color_option 
      set -U fish_pager_color_secondary_completion 
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };
}
