## Contributing
To start contributing, take a look at the standard as this lays down the base for all clients.
This standard is subject to change so always review this before committing any meaningful work.
You can visit the standard [here](https://github.com/kin-labs/kinetic/discussions/317)

## To get started, install the Flutter SDK on your local machine by visiting the link below:
`https://docs.flutter.dev/get-started/install`

## Install OpenAPI Generator (For alternative installs visit: https://openapi-generator.tech)
In the example below we assume the installation via Node Package Manager
`npm install @openapitools/openapi-generator-cli -g`

## Fetch repo and go to working directory
`git clone https://github.com/kin-labs/kinetic-dart.git`

## Generate OpenAPI Dart client
`cd kinetic-dart`
`./setup.sh`

## Directory labels
- lib/generated) Contains all the generated Dart client code based on the openapi spec.
- lib/helpers) Contains helper functions that simply calling the createAccount and makeTranfer sdk functions
- lib/identifiers) Simple directory with only one file that holds a reference to the client version being used. Please change according to your environment if different.
- lib/interfaces) Here you can find all reference to classes to-be created and what they override.