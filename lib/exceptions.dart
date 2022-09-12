class KineticInitializationException implements Exception {
  String errMsg() => "Local Kinetic instance not initialized.";
}

class KineticUnknownFeePayerException implements Exception {
  String errMsg() => "Kinetic Fee Payer not set.";
}

class KineticInvalidDestinationException implements Exception {
  String errMsg() => "Destination set is not valid";
}

class KineticUnknownDecimalsException implements Exception {
  String errMsg() => "Cannot find decimals in current App Config";
}

class KineticMissingMintsException implements Exception {
  String errMsg() => "Kinetic Mints list is incomplete or not found.";
}

class KineticForeignKeyLengthException implements Exception {
  String errMsg() => "Foreign key size used in memo is too large.";
}