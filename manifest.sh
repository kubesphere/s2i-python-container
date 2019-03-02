# Manifest for Dockerfiles creation
# every dest path will be prefixed by $DESTDIR/$version

# Files containing distgen directives
DISTGEN_RULES="
    src=src/cccp.yml
    dest=cccp.yml;

    src=src/README.md
    dest=README.md;

    src=src/root/opt/app-root/etc/scl_enable
    dest=root/opt/app-root/etc/scl_enable;

    src=src/s2i/bin/assemble
    dest=s2i/bin/assemble
    mode=0755;

    src=src/s2i/bin/usage
    dest=s2i/bin/usage
    mode=0755;

    src=src/test/pipenv-test-app/Pipfile
    dest=test/pipenv-test-app/Pipfile;

    src=src/test/pipenv-test-app/Pipfile.lock
    dest=test/pipenv-test-app/Pipfile.lock;
"

# Files containing distgen directives, which are used for each
# (distro, version) combination not excluded in multispec
DISTGEN_MULTI_RULES="
    src=src/Dockerfile.template
    dest=Dockerfile;

    src=src/Dockerfile.template
    dest=Dockerfile.rhel7;

    src=src/Dockerfile.template
    dest=Dockerfile.rhel8;

    src=src/Dockerfile.template
    dest=Dockerfile.fedora;
"

# Symbolic links
SYMLINK_RULES="
    link_target=../../examples/app-home-test-app
    link_name=test/app-home-test-app;

    link_target=../../examples/django-test-app
    link_name=test/django-test-app;

    link_target=../../examples/locale-test-app
    link_name=test/locale-test-app;

    link_target=../../examples/mod-wsgi-test-app
    link_name=test/mod-wsgi-test-app;

    link_target=../../examples/npm-virtualenv-uwsgi-test-app
    link_name=test/npm-virtualenv-uwsgi-test-app;

    link_target=../../examples/numpy-test-app
    link_name=test/numpy-test-app;

    link_target=../../examples/setup-requirements-test-app
    link_name=test/setup-requirements-test-app;

    link_target=../../examples/setup-test-app
    link_name=test/setup-test-app;

    link_target=../../examples/standalone-test-app
    link_name=test/standalone-test-app;

    link_target=../../test/run
    link_name=test/run;
"

# Files to copy
COPY_RULES="
    src=src/root/opt/app-root/etc/generate_container_user
    dest=root/opt/app-root/etc/generate_container_user;

    src=src/s2i/bin/run
    dest=s2i/bin/run
    mode=0755;

    src=examples/pipenv-test-app/testapp.py
    dest=test/pipenv-test-app/testapp.py;

    src=examples/pipenv-test-app/setup.py
    dest=test/pipenv-test-app/setup.py;

    src=examples/pipenv-test-app/.s2i/environment
    dest=test/pipenv-test-app/.s2i/environment;

    src=examples/pipenv-test-app/.gitignore
    dest=test/pipenv-test-app/.gitignore;
"
