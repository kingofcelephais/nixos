{ ... }:

{
  programs.git = {
    enable = true;
    config = {
      init = { defaultBranch = "main"; };
      url = { "https://github.com/" = { insteadOf = [ "gh:" "github:" ]; }; };
      user = {
        email = "notdeadjustdreaming@proton.me";
        name = "King of Celephais";
      };
    };
  };
}
