import 'dart:math';

import 'package:flutter/foundation.dart';

import 'exceptions.dart';
import 'interfaces/transaction_type.dart';

safePrint(dynamic msg) {
  if (kDebugMode) {
    print(msg.toString());
  }
}

getRawQuantity(double quantity, int decimals) {
  return quantity * pow(10, decimals);
}

createKinMemoInstruction(TransactionType type, int appIndex, {List fk = const []}) {
  var _version = 1;
  var _type = type;
  var _index = appIndex;

  var b = List.filled(32, 0);

  if (fk.length > 29) {
    throw KineticForeignKeyLengthException();
  }

  // encode magic byte + version
  b[0] = 0x1;
  b[0] |= _version << 2;

  // encode transaction type
  b[0] |= (_type.index & 0x7) << 5;
  b[1] = (_type.index & 0x18) >> 3;

  // encode AppIndex
  b[1] |= (_index & 0x3f) << 2;
  b[2] = (_index & 0x3fc0) >> 6;
  b[3] = (_index & 0xc000) >> 14;

  if (fk.isNotEmpty) {
    b[3] |= (fk[0] & 0x3f) << 2;
    // insert the rest of the fk. since each loop references fk[n] and fk[n+1], the upper bound is offset by 3 instead of 4.
    for (var i = 4; i < 3 + fk.length; i++) {
      // apply last 2-bits of current byte
      // apply first 6-bits of next byte
      b[i] = (fk[i - 4] >> 6) & 0x3;
      b[i] |= (fk[i - 3] & 0x3f) << 2;
    }

    // if the foreign key is less than 29 bytes, the last 2 bits of the FK can be included in the memo
    if (fk.length < 29) {
      b[fk.length + 3] = (fk[fk.length - 1] >> 6) & 0x3;
    }
  }

  return b;
}
