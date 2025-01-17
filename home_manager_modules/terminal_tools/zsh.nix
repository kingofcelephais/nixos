{ pkgs, lib, config, ... }: {
  options = { zsh.enable = lib.mkEnableOption "enables zsh"; };
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      completionInit = ''
        autoload -Uz add-zsh-hook
        _kura_prompt() {
          PROMPT="$(kura_prompt)"
        }
        add-zsh-hook precmd _kura_prompt
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      '';
      #autoload -U compinit
      initExtra = let
        filter = pkgs.writeShellScriptBin "lessfilter" ''
          mime=$(file -bL --mime-type "$1")
          category=''${mime%%/*}
          kind=''${mime##*/}
          if [ -d "$1" ]; then
            eza --color=always -hl --icons "$1"
          elif [ "$category" = image ]; then
            ${pkgs.chafa}/bin/chafa "$1"
            ${pkgs.exiftool}/bin/exiftool "$1"
          elif [ "$kind" = vnd.openxmlformats-officedocument.spreadsheetml.sheet ] || \
            [ "$kind" = vnd.ms-excel ]; then
            ${pkgs.csvkit}/bin/in2csv "$1" | ${pkgs.xsv}/bin/xsv table | ${pkgs.bat}/bin/bat -ltsv --color=always
          elif [ "$category" = text ]; then
            ${pkgs.bat}/bin/bat --color=always --pager=always "$1"
          else
            ${pkgs.bat}/bin/bat --color=always --pager=always "$1"
          fi
        '';
      in ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ''${(Q)realpath}'
        export LESSOPEN='|${filter}/bin/lessfilter %s'
        zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
        zstyle ':fzf-tab:*' switch-group '<' '>'
        zstyle ':fzf-tab:*' fzf-min-height 100
        zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ''${(P)word}'
        zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
        zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
        zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
        eval "$(zoxide init zsh)"
      '';
      #eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config /home/kuranes/.config/oh-my-posh/theme.yaml)"
      shellAliases = {
        cd = "z";
        update =
          "sudo nixos-rebuild switch --flake /home/kuranes/nixos#default";
      };
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
      extraOptions =
        [ "--header" "--bytes" "--modified" "--octal-permissions" ];
    };
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--border"
        "--preview '${pkgs.pistol}/bin/pistol {}'"
      ];
    };
    programs.tmux = {
      enable = true;
      clock24 = true;
      disableConfirmationPrompt = true;
      shell = "\${pkgs.zsh}/bin/zsh";
    };
    programs.fd = {
      enable = true;
      hidden = true;
    };
    home.file.".lessfilter".text = ''
      mime=$(file -bL --mime-type "$1")
      category=''${mime%%/*}
      kind=''${mime##*/}
      if [ -d "$1" ]; then
        eza --color=always -hl --icons "$1"
      elif [ "$category" = image ]; then
        ${pkgs.chafa}/bin/chafa "$1"
        ${pkgs.exiftool}/bin/exiftool "$1"
      elif [ "$kind" = vnd.openxmlformats-officedocument.spreadsheetml.sheet ] || \
        [ "$kind" = vnd.ms-excel ]; then
        ${pkgs.csvkit}/bin/in2csv "$1" | ${pkgs.xsv}/bin/xsv table | ${pkgs.bat}/bin/bat -ltsv --color=always
      elif [ "$category" = text ]; then
        ${pkgs.bat}/bin/bat --color=always --pager=always "$1"
      else
        ${pkgs.bat}/bin/bat --color=always --pager=always "$1"
      fi
    '';
  };

  #eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config /home/kuranes/.config/oh-my-posh/theme.yaml)"
}
