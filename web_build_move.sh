

# Deletes the current docs species markdown and replaces it with the information from web_build
rm -r docs/ant
rm -r docs/bee
rm -r docs/wasp
cp -r py/build/out/ant docs/
cp -r py/build/out/bee docs/
cp -r py/build/out/wasp docs/