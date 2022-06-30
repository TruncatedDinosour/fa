#!/usr/bin/env sh

set -e

main() {
    ./src/fac ./examples/all_features.fa -run
    rm -- ./all_features ./all_features.asm

    sh ./scripts/docindex.sh
    bash ./scripts/test.sh

    git add -A
    git commit -sa
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

main "$@"
