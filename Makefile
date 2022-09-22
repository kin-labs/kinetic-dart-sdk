analyze:
	dart analyze

format:
	dart format lib/interfaces lib/helpers lib/*.dart -l 120 --fix --set-exit-if-changed

setup:
	npm install @openapitools/openapi-generator-cli -g

generate_api:
	npx openapi-generator-cli generate -i https://raw.githubusercontent.com/kin-labs/kinetic/dev/api-swagger.json -g dart -o lib/generated

generate_pre:
	rm -rf lib/generated

generate_post:
	rm -rf lib/generated/{.openapi-generator,doc,test,git_push.sh,README.md,analysis_options.yaml,.travis.yml,pubspec.yaml,.openapi-generator-ignore,.gitignore}

generate:  generate_pre generate_api generate_post format

all: analyze generate