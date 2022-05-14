import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/helpers/error_handler.dart';
import 'package:flutter_folder/models/account.dart';
import 'package:flutter_folder/services/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountModel extends ChangeNotifier {
  final Authentication _auth = Authentication();
  bool fetching = false;
  bool _userLogedIn = false;
  String imagePickerPath = "";

  late Account _account = Account.empty();

  String get email => _account.email;

  Future<bool> login(LoginRequestModel data) async {
    fetching = true;
    try {
      var response = await _auth.login(data);

      fetching = false;
      _account = Account.fromAuthen(response);
      const storage = FlutterSecureStorage();
      storage.write(key: "token", value: response.token);
      _userLogedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Account getUserLoginDetails() => _account;

  bool getisUserLogedIn() {
    return _userLogedIn;
  }

  Future<void> updateProfile(Account value, VoidCallback onSuccess) async {
    try {
      var res = await withRestApiResponse("/account/update-account-information",
          method: "post", body: value.toBodyJson());
      if (json.decode(res)["firstName"] != null) {
        onSuccess();
      }
    } catch (e) {
      rethrow;
    }
  }

  void setImagePath(String path) {
    imagePickerPath = path;
    notifyListeners();
  }
}
