# Kinetic Dart SDK

Kinetic Dart SDK is the official [dart](https://dart.dev/) SDK for [Kinetic](https://github.com/kin-labs/kinetic) based on the [Kinetic SDK Standard](https://github.com/kin-labs/kinetic/discussions/317).

This SDK allows developers to rapidly integrate Kin and other SPL tokens in their app.

## Usage

In order to use this SDK, please head over to the [Kinetic Dart SDK](https://kinetic.kin.org/docs/sdk/dart) documentation.

## Version

This SDK is built to work with `@kinetic/api@v1.0.0-rc.8`. Using it with other versions may lead to issues.

## Contributing

If you want to contribute to this SDK, please follow the steps below to get it running locally:

#### 1. Install the Flutter SDK on your local machine by visiting the link below:
[Install Flutter](https://docs.flutter.dev/get-started/install)

#### 2. Install the OpenAPI Generator via NPM (for alternative installs visit: https://openapi-generator.tech)
`$ npm install @openapitools/openapi-generator-cli -g`

#### 3. Fetch the Kinetic Dart repo
`$ git clone https://github.com/kin-labs/kinetic-dart.git`

#### 4. Change into kinetic-dart working directory
`$ cd kinetic-dart`

#### 5. Run the tests
`$ flutter test`

#### 6. Generate OpenAPI Dart client
`$ make generate`

#### 7. Format the code
`$ make format`

## Directory labels
- [generated](https://github.com/kin-labs/kinetic-dart/tree/main/lib/generated) Contains all the generated Dart client code based on the openapi spec.
- [helpers](https://github.com/kin-labs/kinetic-dart/tree/main/lib/helpers) Contains helper functions that simply calling the createAccount and makeTranfer sdk functions
- [identifiers](https://github.com/kin-labs/kinetic-dart/tree/main/lib/identifiers) Simple directory with only one file that holds a reference to the client version being used. Please change according to your environment if different.
- [interfaces](https://github.com/kin-labs/kinetic-dart/tree/main/lib/interfaces) Here you can find all reference to classes to-be created and what they override.

## Contributing
To start contributing, take a look at the standard as this lays down the base for all clients.
This standard is subject to change so always review this before committing any meaningful work.
You can visit the standard [here](https://github.com/kin-labs/kinetic/discussions/317)