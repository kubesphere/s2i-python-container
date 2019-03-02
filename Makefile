# Variables are documented in common/build.sh.
BASE_IMAGE_NAME = python
VERSIONS = 2.7 3.5 3.6 3.7
KubeSphere_NAMESPACES =

# HACK:  Ensure that 'git pull' for old clones doesn't cause confusion.
# New clones should use '--recursive'.
.PHONY: $(shell test -f common/common.mk || echo >&2 'Please do "git submodule update --init" first.')

include common/common.mk
