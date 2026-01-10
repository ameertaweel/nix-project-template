# Nix Project Templates

This project provides simple templates for Nix projects.

Available templates:
- With Flakes
- Without Flakes (Nixpkgs pinning using `npins`)

This project was heavily inspired by:
[Misterio77/nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).

## Template With Flakes

### Initializing a Project

```bash
mkdir $PROJECT_DIR
cd $PROJECT_DIR
nix flake init -t github:AmeerTaweel/nix-project-template#flakes
```

## Template Without Flakes

### Initializing a Project

```bash
mkdir $PROJECT_DIR
cd $PROJECT_DIR
nix flake init -t github:AmeerTaweel/nix-project-template#no-flakes
```

