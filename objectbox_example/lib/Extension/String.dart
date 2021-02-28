import 'dart:convert';
import 'package:crypto/crypto.dart';

extension ExtensionString on String {
  String get generateMd5 {
    return md5.convert(utf8.encode(this)).toString();
  }
}
