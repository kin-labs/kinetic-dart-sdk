## Install OpenAPI Generator (For alternative installs visit: https://openapi-generator.tech)
In the example below we assume the installation via Node Package Manager
`npm install @openapitools/openapi-generator-cli -g`

## Fetch repo and install OpenAPI Dart client
`git clone https://github.com/kin-labs/kinetic-dart.git`
`cd kinetic-dart`
rm -rf lib/generated/ ; npx @openapitools/openapi-generator-cli generate -i https://raw.githubusercontent.com/kin-labs/kinetic/beeman/openapi/api-swagger.json -g dart -o lib/generated/ ; rm -rf lib/generated/test