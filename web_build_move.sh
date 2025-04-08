# Deletes the current docs species markdown and replaces it with the information from web_build
rm -r docs/ant
rm -r docs/bee
rm -r docs/wasp
mv -v web_build/out/ docs/