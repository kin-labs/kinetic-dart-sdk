rm -rf lib/generated/ \
  && npx openapi-generator-cli generate -i https://raw.githubusercontent.com/kin-labs/kinetic/dev/api-swagger.json -g dart -o lib/generated/ \
  && rm -rf lib/generated/{.openapi-generator,doc,test,git_push.sh,README.md,analysis_options.yaml,.travis.yml,pubspec.yaml,.openapi-generator-ignore,.gitignore}