#!/bin/sh
set -e
if [ -f "./Pipfile" ]; then
    pipenv install --deploy --system
else
    echo "No initial Pipfile, you may want to make one"
fi

set -x
if [ -n "$@" ]; then
    # if our command is a valid pipenv subcommand, let's invoke it through pipenv instead
    # (this allows for "docker run diginc/pipenv-goodies lock ", etc)
    if pipenv "$1" --help > /dev/null 2>&1; then
        set -- pipenv "$@"
    fi
fi

exec "$@"
