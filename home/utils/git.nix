{
  programs.git = {
    enable = true;
    extraConfig = ''
        [init]
            defaultBranch = main

        [url "https://github.com/"]
            insteadOf = "gh:"
            insteadOf = "github:"

        [user]
            name = "sholdue"
            email = "sholdue@gmail.com"

        [url "https://github.com/"]
            insteadOf = "gh:"
            insteadOf = "github:"

        [core]
            editor = "nvim"

        [alias]
            co = checkout
            br = branch
            cm = commit
            st = status
    '';
  };
}
