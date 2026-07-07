# Install package dependencies declared inside your configuration file
make -f web4.mk install

# Compile low-level native optimizations across your polyglot files
make -f web4.mk build

# Execute functional verification pipelines and test scripts
make -f web4.mk test

# Launch the Web4 localized client runtime and sandbox marketplace interface
make -f web4.mk up

# Purge transient cache objects and generated build components
make -f web4.mk clean
