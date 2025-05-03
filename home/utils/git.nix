{
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "master";

      core.editor = "nixvim";

      push.default = "current";

      color.ui = true;
      "color \"diff-highlight\"" = {
        oldNormal = "red bold";
        oldHighlight = "red bold";
        newNormal = "green bold";
        newHighlight = "green bold ul";
      };
      "color \"diff\"" = {
        meta = "yellow";
        frag = "magenta bold";
        commit = "yellow bold";
        old = "red bold";
        new = "green bold";
        whitespace = "red reverse";
      };

      pull.rebase = false;
    };
  };
}
