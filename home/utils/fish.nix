{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting "Добро пожаловать в рыбу, дружелюбная скорлупа для взаимодействий.
                Напечатайте помощь для инструкций по тем как употреблять рыбу.
                            шульдить собака мира. приблизительно больше"

      # Монотонная палитра на основе ff66cc (розово-неоновый)
      set -g fish_color_normal ff66cc        # основной тон
      set -g fish_color_command ff3399       # чуть темнее
      set -g fish_color_param ff99cc         # чуть светлее
      set -g fish_color_comment cc6699       # приглушённый
      set -g fish_color_error cc3366         # тёмный акцент
      set -g fish_color_operator ff80bf      # промежуточный
      set -g fish_color_escape ff66cc
      set -g fish_color_end ff4da6           # ближе к малиновому
      set -g fish_color_quote ff99cc
      set -g fish_color_redirection ff80bf
      set -g fish_color_search_match --background=33001a
      set -g fish_color_selection --background=1a0011
      set -g fish_color_history_current ff66cc

      # Розовый prompt
      function fish_prompt
        set_color ff66cc
        echo -n "[lain@world]"
        set_color normal
        echo -n " "
      end
    '';
  };
}
