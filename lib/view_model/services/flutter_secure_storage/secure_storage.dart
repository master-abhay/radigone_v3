import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

 Future<String> readSecureData(String key) async {
    String value =
        await _flutterSecureStorage.read(key: key) ?? "Data Not Found";
    // print("Data recieved from Secure Srorage: $value");

    return value;
  }
deleteSecureData(String key)async{

}


}
