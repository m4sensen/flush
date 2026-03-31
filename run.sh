#!/usr/bin/env bash
(
    set -Eeuo pipefail
    IFS=$'\n\t'

    # Defining the project directory
    readonly PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    DATE="$(date +'%Y-%m-%d %H:%M:%S')"
    readonly INIT_TIME="$DATE"

    require() {
        local filePath="$PROJECT_DIR/$1"

        if [[ ! -f "$filePath" || ! -r "$filePath" ]]; then
            echo "Fatal: cannot load $filePath" >&2
            exit 1
        fi

        source "$filePath"
}

    require "init/base.sh"
    require "init/core.sh"

)