{ config, pkgs, ... }:
let
  my-python = pkgs.python3.withPackages
    (ps: [ ps.pip ps.tox ps.setuptools ps.pip-tools ps.pipx ]);
  shellAliases = import ./aliases.nix;
in {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  # imports = [ ./emacs.nix ];
  # programs.emacs = {
  #   enable = true;
  #   extraPackages = (epkgs:
  #     with epkgs; [
  #       org
  #       magit
  #       evil
  #       projectile
  #       helm
  #       org-bullets
  #       ob-ipython
  #       deft
  #       markdown-mode
  #       pandoc-mode
  #       ace-jump-mode
  #       solarized-theme
  #       helm-bibtex
  #     ]);
  # };
  # home.file.".emacs".source = ~/dotfiles/.dotfiles/emacs.d/init.el;

  programs.emacs = { enable = true; };
  home.file.".spacemacs.d".source =
    config.lib.file.mkOutOfStoreSymlink ~/dotfiles/emacs/spacemacs.d;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs;
    [
      hugo
      nixfmt
      kubectl
      google-cloud-sdk
      openssh
      unixtools.watch
      rsync
      curl
      ag
      jq
      gnumake

      #my-python
      netcdf
      bitwarden-cli

      # git
      gitAndTools.hub
      gitAndTools.gh

      # haskell ecosystem
      stack
      cabal-install
      hlint

      # nix
      cachix
      niv
    ] ++ lib.optionals pkgs.stdenv.isLinux [ slack spotify ];

  home.sessionVariables = { EDITOR = "vim"; };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;

  accounts.email.accounts.gmail = {
    primary = true;
    flavor = "gmail.com";
    address = "nbren12@gmail.com";
    realName = "Noah D. Brenowitz";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      tls = {
        enable = true;
        certificatesFile = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      };
    };
    smtp = {
      host = "smtp.gmail.com";
      port = 465;
      tls = {
        enable = true;
        certificatesFile = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      };
    };
    passwordCommand = "echo $EMAIL_PASSWD";

    msmtp = { enable = true; };
    mbsync.enable = true;
    neomutt.enable = true;
  };

  programs.neomutt.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks = {
      digitalocean = {
        hostname = "138.68.20.134";
        user = "noah";
      };

      work = {
        hostname = "34.68.113.117";
        user = "noahb";
        localForwards = [{
          bind.port = 10001;
          bind.address = "127.0.0.1";

          host.port = 8888;
          host.address = "127.0.0.1";
        }];
      };
    };
  };

  programs.gpg.enable = true;
  services.gpg-agent.enable = pkgs.stdenv.isLinux;

  programs.git = {
    enable = true;
    userName = "Noah D. Brenowitz";
    userEmail = "nbren12@gmail.com";
    extraConfig = {
      diff = { submodule = "log"; };
      status = { submoduleSummary = true; };
      pull = { ff = "only"; };
    };

    signing = {
      signByDefault = true;
      key = "0x55465F962E05AAD1";
    };

    aliases = {
      a = "add";
      co = "checkout";
      br = "branch";
      ds = "diff --stat";
      ls =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative";
      lss = ''
        log --pretty=format:"%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate'';
      ll = ''
        log --pretty=format:"%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate --numstat'';
      ln = "log --name-status";
      li = "log --stat";
      lsf = "ls-files";
      cp = "cherry-pick";
      st = "status -s";
      cl = "clone";
      ci = "commit";
      cm = "commit --amend";
      diff = "diff --word-diff";
      dc = "diff --cached";
      ttc = "clean -x -d";
      pf = "push --force-with-lease";
    };
    ignores = [
      "*.aux"
      "*.bbl"
      "*.bcf"
      "*.blg"
      "*.pdf"
      "*.gz"
      "*.fdb_latexmk"
      ".envrc"
      ".env"
      ".vscode"
      "shell.nix"
      ".DS_Store"
    ];
  };

  # neovim works but vim hangs indefinitely on MacOS
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraConfig = builtins.readFile ~/dotfiles/vim/vanilla.vim;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = ctrlp-vim;
        config = ''
          nnoremap <leader>r :CtrlPMRUFiles<CR>
        '';
      }
      vim-fugitive
      vim-surround
      vim-unimpaired
      vim-nix
      tcomment_vim
    ];

  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ~/dotfiles/tmux.conf;
  };

  programs.direnv = { enable = true; };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx NIX_FISH 1
      fish_vi_key_bindings

      # key bindings
      bind -M insert \cg 'git status'
    '';

    plugins = [{
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
        sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
      };
    }];
    inherit shellAliases;
  };
  home.file.".config/fish/conf.d/prompt.fish".source =
    ~/dotfiles/.config/fish/conf.d/prompt.fish;

  programs.bash = {
    enable = true;
    inherit shellAliases;

    # globstar and checkjobs are not present in the mac login shell
    shellOptions = [ "histappend" "checkwinsize" "extglob" ];

    initExtra = pkgs.lib.optionalString config.programs.fish.enable ''
      if [[ -z $NIX_FISH ]]; then
        fish
        exit
      fi
    '';
  };

  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;

  programs.vscode = { enable = true; };

  programs.irssi = {

    enable = true;
    networks = {
      freenode = {
        nick = "nbren12";
        server = {
          address = "irc.freenode.net";
          port = 6697;
          autoConnect = true;
        };
      };
    };
  };
}
