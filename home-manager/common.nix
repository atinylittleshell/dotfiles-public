{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.language.base = "en_US.UTF-8";

  home.packages = with pkgs; [
    # cli tools
    curl
    wget
    jq
    fd
    fastfetch
    ripgrep
    killall

    # development
    gcc
    bun
    neovim
    rustup
    zip
    unzip

    # fonts
    nerd-fonts.hack
    roboto
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      rebase = {
        updateRefs = true;
      };
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$python$conda$character";

      directory = {
        style = "blue";
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        format = "[$branch]($style)";
	      style = "bright-black";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
	      style = "cyan";
	      stashed = "≡";
      };

      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
	      style = "bright-black";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
	      style = "yellow";
      };

      python = {
        format = "[$virtualenv]($style) ";
	      style = "bright-black";
      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      ".." = "cd ..";
      "m" = "git switch main";
      "mst" = "git switch master";
      "pull" = "git pull";
      "push" = "git push";
      "pushf" = "git push --force";
      "add" = "git add .";
      "amend" = "git commit --amend";
      "reset" = "git reset --soft HEAD^";
      "rebasem" = "git rebase -i main";
      "rebasemst" = "git rebase -i master";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

      eval "$(starship init zsh)"
    '';
  };
}
