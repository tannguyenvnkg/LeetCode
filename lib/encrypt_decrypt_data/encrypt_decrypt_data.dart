import 'dart:convert' as CONVERT;
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;

// Json chưa mã hóa
String json = """
    {"Username":"testmap","Password":"123456","OS":1,"token":""}
    """;

//Json mã hóa
int responseChecksum = 10997183;

void main() {
  // mã hóa
  if (json.isNotEmpty) {
    serialize(CONVERT.json.encode(CONVERT.json.decode(json)));
  }
  print('\n\n');
  print(
      '=====================================================================\n');
  //Giải mã
  var filePath = p.join(Directory.current.path, 'lib', 'encrypt_decrypt_data',
      'encrypt_data.txt');
  File file = File(filePath);
  var fileContent = file.readAsStringSync();

  if (fileContent.isNotEmpty) {
    _deserialize(fileContent, responseChecksum);
  }
}

String _encodeDataRequest = '';
int _checksum = 0;
serialize(String json) {
  //  print("Request: " + json);
  _checksum = 0;
  _encodeDataRequest = '';
  if (json.isNotEmpty) {
    try {
      var sc = 0;
      var bytes = CONVERT.utf8.encode(json); //Encoding.UTF8.GetBytes(Data);

      //ArrayList<byte> result = new ArrayList<byte>();
      var result = Uint8List(bytes.length + 1);
      for (int i = 0; i < bytes.length; i++) {
        result[i] = (bytes[i] + 65 + i);
        _checksum += bytes[i];
        sc += bytes[i];
      }
      result[result.length - 1] = sc;
      _encodeDataRequest = CONVERT.base64Encode(result);
      print('Chuỗi sau khi mã hóa');
      print('$_encodeDataRequest\n');
      print('CheckSum: $_checksum');
    } catch (e) {
      print('serialize: $e');
      _checksum = 0;
      _encodeDataRequest = '';
    }
  }
}

void _deserialize(String data, int checkSum) {
  if (data.isNotEmpty) {
    try {
      Uint8List bytes = CONVERT.base64Decode(data);

      if (bytes[bytes.length - 1] == (checkSum & 0xff)) {
        var byte2 = Uint8List(bytes.length - 1);

        for (int i = 0; i < bytes.length - 1; i++) {
          byte2[i] = (bytes[i] - 65 - i);
        }

        print("Chuỗi sau khi giải mã");
        print(prettyPrintJson(CONVERT.utf8.decode(byte2)));
        print('\nresponseChecksum: $responseChecksum');
      }
    } catch (e) {
      print('deserialize: $e');
    }
  }
}

String prettyPrintJson(jsonString) {
  var jsonObject = CONVERT.json.decode(jsonString);
  String prettyString = _printJson(jsonObject);

  return prettyString;
}

String _printJson(jsonObject, {int indent = 0}) {
  String prettyString = "";
  if (jsonObject is Map) {
    prettyString += "{\n";
    int index = 0;
    jsonObject.forEach((key, value) {
      if (value is String) {
        prettyString += "${" " * (indent + 2)}\"$key\": \"$value\"";
      } else {
        prettyString +=
            "${" " * (indent + 2)}\"$key\": ${_printJson(value, indent: indent + 2)}";
      }
      if (index < jsonObject.length - 1) {
        prettyString += ",\n";
      } else {
        prettyString += "\n";
      }
      index++;
    });
    prettyString += "${" " * indent}}";
  } else if (jsonObject is List) {
    prettyString += "[\n";
    for (var i = 0; i < jsonObject.length; i++) {
      prettyString +=
          "${" " * (indent + 2)}${_printJson(jsonObject[i], indent: indent + 2)}";
      if (i < jsonObject.length - 1) {
        prettyString += ",\n";
      } else {
        prettyString += "\n";
      }
    }
    prettyString += "${" " * indent}]";
  } else {
    prettyString += jsonObject.toString();
  }
  return prettyString;
}
