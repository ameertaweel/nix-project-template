# Nix Project Templates

This project provides simple templates for Nix projects.

Available templates:
- With Flakes
- Without Flakes (Nixpkgs pinning using [Nixtamal][nixtamal])
- Without Flakes (Nixpkgs pinning using [`npins`][npins])

This project was heavily inspired by:
[Misterio77/nix-starter-configs][nix-starter-configs].

## Template With Flakes

### Initializing a Project

```bash
mkdir $PROJECT_DIR
cd $PROJECT_DIR
nix flake init -t github:AmeerTaweel/nix-project-template#flakes
```

## Templates Without Flakes

### Initializing a Project Using [Nixtamal][nixtamal]

```bash
mkdir $PROJECT_DIR
cd $PROJECT_DIR
nix flake init -t github:AmeerTaweel/nix-project-template#nixtamal
```

### Initializing a Project Using [`npins`][npins]

```bash
mkdir $PROJECT_DIR
cd $PROJECT_DIR
nix flake init -t github:AmeerTaweel/nix-project-template#npins
```

[nixtamal]: https://nixtamal.toast.al
[npins]: https://github.com/andir/npins
[nix-starter-configs]: https://github.com/Misterio77/nix-starter-configs
