{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # Kitty terminal color scheme based on #ff66cc with gradients

      background #1a0011  # Very dark background (almost black, with a hint of purple)
      foreground #ff66cc  # Default foreground color (neon pink)

      # Basic Colors
      color0 #1a0011  # Dark background
      color1 #cc3366  # Darker pink
      color2 #ff3399  # Slightly lighter pink
      color3 #ff66cc  # Primary neon pink
      color4 #ff80bf  # Lightened pink
      color5 #cc6699  # Muted pink (for comments or less important text)
      color6 #ff99cc  # Light pink (used for parameters or variables)
      color7 #ff99cc  # Light pink for highlighted text
      color8 #ff4da6  # Slightly more saturated pink for accents
      color9 #ff3399  # Error color (dark pink)
      color10 #ff66cc  # Command color (bright neon)
      color11 #ff80bf  # Operator color (light neon)
      color12 #ff66cc  # Escape sequences in the same pink tone
      color13 #ff99cc  # Quote colors
      color14 #ff80bf  # Redirection color (used for outputs and system messages)
      color15 #ff66cc  # Selection and search match color (bright neon pink)

      # Special Colors
      cursor #ff66cc  # Neon pink cursor color
      selection_background #33001a  # Dark red/purple background for selected text
      selection_foreground #ff66cc  # Neon pink text color for selected text
      search_match #ff99cc  # Light pink search highlight
    '';
  };
}
