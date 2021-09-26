# builder.sh
source $stdenv/setup

buildPhase() {
  if ["$PROFILE" = "RELEASE"]; then
    cargo build --release
  else
    cargo build
  fi
}

installPhase() {
  cargo build --release
  mkdir -p $out/bin
  cargo install --target-dir $out/bin
}

genericBuild