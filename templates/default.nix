{
  python = {
    path = ./python;
    description = "Python development environment";
    welcomeText = ''
      # Python Development Environment

      ## Included tools
      - python3
      - uv (package manager)

      ## Getting Started
      - Run `nix develop`
      - Run `uv init`
    '';
  };
  rust = {
    path = ./rust;
    description = "Rust development environment";
    welcomeText = ''
      # Rust Development Environment

      ## Included tools
      - rustc
      - cargo

      ## Getting Started
      - Run `nix develop`
      - Run `cargo init`
    '';
  };
  nodejs = {
    path = ./nodejs;
    description = "NodeJS development environment";
    welcomeText = ''
      # NodeJS Development environment

      ## Included tools
      - bun (runtime and package manager)

      ## Getting Started
      - Run `nix develop`
      - Run `bun init`
    '';
  };
}
