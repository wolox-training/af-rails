[ "$RUN_PYLINT" ] && return 0   # Nothing to do

for script in \
    install_mssql.sh    \
do
    foldable source $TRAVIS_BUILD_DIR/.travis/$script
done
